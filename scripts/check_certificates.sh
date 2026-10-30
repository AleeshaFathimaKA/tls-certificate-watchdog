#!/bin/bash

# TLS Certificate Expiry Watchdog

DOMAIN_FILE="config/domains.txt"
LOG_FILE="logs/certificate_monitor.log"

mkdir -p logs 


echo "===================================="
echo "TLS Certificate Monitoring"
echo "Date: $(date)"
echo "===================================="

while IFS= read -r domain
do
    [ -z "$domain" ] && continue


    echo ""
    echo "Checking: $domain"

    expiry_date=$(timeout 10 openssl s_client \
       -connect "$domain:443" \
       -servername "$domain" \
       </dev/null 2>/dev/null |
openssl x509 -noout -enddate 2>/dev/null)

    if [ -z "$expiry_date" ]; then
        status="ERROR: Unable to retrieve certificate"
        echo "$status for $domain"
        echo "$(date) | $domain | $status" >> "$LOG_FILE"
        continue
    fi

    expiry_date=${expiry_date#notAfter=}

    expiry_timestamp=$(date -d "$expiry_date" +%s)
    current_timestamp=$(date +%s)

    remaining_seconds=$((expiry_timestamp - current_timestamp))
    remaining_days=$((remaining_seconds / 86400))

    if [ "$remaining_days" -lt 0 ]; then
        status="EXPIRED"
    elif [ "$remaining_days" -le 7 ]; then
        status="CRITICAL"
    elif [ "$remaining_days" -le 14 ]; then
        status="WARNING"
    elif [ "$remaining_days" -le 30 ]; then
        status="NOTICE"
    else
        status="HEALTHY"
    fi

    echo "Expiry date: $expiry_date"
    echo "Days remaining: $remaining_days"
    echo "Status: $status"

    echo "$(date) | $domain | $expiry_date | $remaining_days days | $status" >> "$LOG_FILE"

done < "$DOMAIN_FILE"

echo ""
echo "Monitoring completed."
