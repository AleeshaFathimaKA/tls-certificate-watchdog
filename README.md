
# TLS Certificate Expiry Watchdog

A Bash-based project that monitors SSL/TLS certificates of multiple domains using OpenSSL.

## Features

- Monitors multiple domains.
- Checks certificate expiry dates.
- Calculates remaining days before expiry.
- Verifies certificate-chain trust.
- Validates domain hostnames.
- Identifies expired and invalid certificates.
- Displays alerts based on expiry dates.
- Handles certificate errors.
- Stores results in log files.
- Runs automatically using Cron.

## Technologies Used

- Ubuntu Linux
- Bash Scripting
- OpenSSL
- Git and GitHub
- Cron

## Alert Levels

| Condition | Status |
|---|---|
| Expired certificate | EXPIRED |
| 7 days or less | CRITICAL |
| 14 days or less | WARNING |
| 30 days or less | NOTICE |
| More than 30 days | HEALTHY |

## Certificate Validation

OpenSSL is used to:
- Check whether the certificate chain is trusted.
- Verify whether the certificate matches the domain name.
- Identify certificate verification failures.

## Project Structure

    tls-certificate-watchdog/
    ├── config/
    │   └── domains.txt
    ├── scripts/
    │   ├── check_certificates.sh
    │   └── test_alerts.sh
    ├── logs/
    └── README.md

## How to Run

Make the script executable:

    chmod +x scripts/check_certificates.sh

Run the monitoring script:

    ./scripts/check_certificates.sh

## Automated Monitoring

Cron is configured to run the monitoring script daily at 8:00 AM server time.

## Learning Outcomes

- Linux command-line operations.
- Bash scripting and automation.
- SSL/TLS certificate monitoring.
- OpenSSL certificate verification.
- Linux logging and Cron scheduling.
- Git and GitHub version control.

## Future Improvements

- Email or AWS SNS notifications.
- Configurable alert thresholds.
- Monitoring dashboard.
- Additional TLS security checks.

