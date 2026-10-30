#!/bin/bash

check_expiry() {
    remaining_days=$1

    echo "Days remaining: $remaining_days"

    if [ "$remaining_days" -lt 0 ]; then
        echo "CRITICAL: Certificate has EXPIRED!"

    elif [ "$remaining_days" -le 7 ]; then
        echo "CRITICAL ALERT: Certificate expires within 7 days!"

    elif [ "$remaining_days" -le 14 ]; then
        echo "WARNING: Certificate expires within 14 days!"

    elif [ "$remaining_days" -le 30 ]; then
        echo "NOTICE: Certificate expires within 30 days!"

    else
        echo "OK: Certificate is healthy."
    fi

    echo "-----------------------------"
}

check_expiry 60
check_expiry 25
check_expiry 12
check_expiry 5
check_expiry -2#!/bin/bash

check_expiry() {
    remaining_days=$1

    echo "Days remaining: $remaining_days"

    if [ "$remaining_days" -lt 0 ]; then
        echo "CRITICAL: Certificate has EXPIRED!"

    elif [ "$remaining_days" -le 7 ]; then
        echo "CRITICAL ALERT: Certificate expires within 7 days!"

    elif [ "$remaining_days" -le 14 ]; then
        echo "WARNING: Certificate expires within 14 days!"

    elif [ "$remaining_days" -le 30 ]; then
        echo "NOTICE: Certificate expires within 30 days!"

    else
        echo "OK: Certificate is healthy."
    fi

    echo "-----------------------------"
}

check_expiry 60
check_expiry 25
check_expiry 12
check_expiry 5
check_expiry -2
