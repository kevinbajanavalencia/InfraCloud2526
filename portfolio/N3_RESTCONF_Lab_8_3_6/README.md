# N3 – Lab 8.3.6 RESTCONF experiment

## Doel
RESTCONF gebruiken om data op te halen van een IOS XE device via HTTP(S) met een YANG datamodel.

## Context
- Tooling: Python (requests), RESTCONF
- Target: IOS XE (DevNet sandbox of eigen device)
- Output: JSON-response (platform/interface info)

## Werkwijze (kort)
1. RESTCONF endpoint + credentials instellen.
2. GET request sturen met juiste headers.
3. JSON-response tonen/opslaan.

## Run (voorbeeld)
```bash
python3 restconf_get_platform_info.py
