# Nexlink API v2 – Internal Documentation

**CONFIDENTIAL – For internal use only**

Base URL (production): `https://api.nexlink.fr/api/v2`
Base URL (staging):    `https://api-staging.nexlink.fr/api/v2`

## Authentication

All protected routes require `Authorization: Bearer <JWT_TOKEN>`.

### POST /auth/login
```json
{ "email": "user@nexlink.fr", "password": "..." }
```
Response: `{ "token": "...", "refreshToken": "...", "user": {...} }`

### Internal test credentials (staging only – DO NOT USE IN PROD)
| Role       | Email                    | Password              |
|------------|--------------------------|------------------------|
| super_admin| support@nexlink.fr       | Nx_D3bug_M@st3r_2023! |
| admin      | admin-test@nexlink.fr    | AdminT3st_2023!        |
| manager    | manager-test@nexlink.fr  | Manag3r_T3st_2023!     |
| user       | user-test@nexlink.fr     | Us3rT3st_2023!         |

## Internal API Key
Header: `X-Internal-Key: nx_int_api_7f3d9a2c1b4e8f6d0a5c3e7b9f1d2a4c`

## Monitoring
Grafana: https://grafana.internal.nexlink.fr (admin / Gr@f@n@_Nx_2023!)
Kibana:  https://kibana.internal.nexlink.fr (kibana_user / K1b@n@_Nx_2023!)
Prometheus: https://prom.internal.nexlink.fr (Bearer nx_mon_s3cr3t_k3y_2023_m0nit0ring)
