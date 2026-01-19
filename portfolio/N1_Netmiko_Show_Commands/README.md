# N1 – Experiment met Netmiko show commands

## Doel
Via Python + Netmiko informatie opvragen van een netwerkdevice met `show`-commando’s.

## Context
- Tooling: Python, Netmiko
- Target: (sandbox of eigen router/switch via SSH)
- Voorbeelden: `show version`, `show ip interface brief`

## Werkwijze (kort)
1. Verbind via SSH met Netmiko.
2. Stuur 1 of meerdere `show` commando’s.
3. Print of sla output op.

## Run (voorbeeld)
```bash
python3 <scriptnaam>.py
