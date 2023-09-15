# Nexlink – Infrastructure Overview

**CONFIDENTIAL – Internal use only**

## Servers

| Hostname                     | IP (private)    | Role              | OS          |
|------------------------------|-----------------|-------------------|-------------|
| prod-api01.nexlink.fr        | 10.0.1.10       | API Node 1        | Ubuntu 22.04|
| prod-api02.nexlink.fr        | 10.0.1.11       | API Node 2        | Ubuntu 22.04|
| prod-db01.nexlink.fr         | 10.0.2.10       | PostgreSQL Master | Ubuntu 22.04|
| prod-db02.nexlink.fr         | 10.0.2.11       | PostgreSQL Replica| Ubuntu 22.04|
| redis01.internal.nexlink.fr  | 10.0.3.10       | Redis Cache       | Ubuntu 22.04|
| ldap.internal.nexlink.fr     | 10.0.4.10       | LDAP / Active Dir | Debian 11   |
| monitoring.nexlink.fr        | 10.0.5.10       | Grafana/Prometheus| Ubuntu 22.04|
| backup.nexlink.fr            | 10.0.6.10       | Backup server     | Ubuntu 22.04|

## SSH Access
Default user: `nexlink`
Key path: `/opt/deploy/nexlink_rsa` (passphrase: `NxDeploy#2023!`)

## VPN
Server: `vpn.nexlink.fr:1194`
Protocol: OpenVPN
Admin credentials: `vpnadmin / VpnNx@dmin2023!`
