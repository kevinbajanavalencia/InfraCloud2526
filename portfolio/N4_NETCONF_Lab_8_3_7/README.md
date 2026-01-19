# N4 – Lab 8.3.7 NETCONF experiment

## Doel
NETCONF gebruiken om gestructureerde data op te vragen van een netwerkdevice (XML/YANG).

## Context
- Tooling: Python (ncclient), NETCONF
- Target: IOS XE (DevNet sandbox of eigen device)
- Output: XML (bv. interfaces/inventory)

## Werkwijze (kort)
1. NETCONF connectie opzetten (poort 830).
2. Filter gebruiken (subtree/xpath) om gerichte data op te vragen.
3. Output tonen of exporteren (bv. naar bestand/Excel).

## Run (voorbeeld)
```bash
python3 <netconf_scriptnaam>.py
