# TLS Certificate Expiry Watchdog

A lightweight Bash-based monitoring tool that checks TLS/SSL certificate expiry dates for multiple domains using OpenSSL.

## Project Overview

TLS certificates secure communication between websites and users through HTTPS. Expired certificates can cause browser security warnings and service disruptions.

This project automates certificate expiry monitoring and identifies certificates that are approaching expiration.

## Features

- Checks certificates for multiple domains.
- Retrieves certificate expiry dates using OpenSSL.
- Calculates the remaining validity in days.
- Generates alerts based on expiry thresholds.
- Handles certificate retrieval failures.
- Records monitoring results in log files.
- Supports automatic daily execution using Cron.

## Technologies Used

- Linux (Ubuntu)
- Bash Shell Scripting
- OpenSSL
- Git and GitHub
- Cron

## Alert Levels

| Condition | Status |
|---|---|
| Expired | EXPIRED |
| 7 days or less | CRITICAL |
| 8–14 days | WARNING |
| 15–30 days | NOTICE |
| More than 30 days | HEALTHY |

## Project Structure

```text
tls-certificate-watchdog/
├── config/
│   └── domains.txt
├── scripts/
│   ├── check


How to Run

1.Clone the repository.

2.Add domains to config/domains.txt

3.Make the script executable:

chmod +x scripts/check_certificates.sh

4.Run the monitoring script:

./scripts/check_certificates.sh

Automated Monitoring

Cron is configured to execute the monitoring script daily at 8:00 AM server time.

Learning Outcomes

This project demonstrates Linux administration, Bash scripting, TLS certificate inspection, error handling, logging, scheduling, and Git version control.

Future Improvements

1.Email or SNS notifications.

2.Certificate chain validation.

3.Monitoring dashboard.

4.Support for configurable alert thresholds.
