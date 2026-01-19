# Pv1 – Python Virtual Environment (venv) (slides 6 & 7)

## Doel
Een Python project uitvoeren in een geïsoleerde omgeving (venv) om dependencies beheersbaar te maken.

## Context
- Tooling: Python 3, `venv`
- Demo code: `sample_demo/`

## Werkwijze (kort)
1. venv aanmaken.
2. venv activeren.
3. Packages installeren.
4. Script starten.

## Run (voorbeeld)
```bash
cd sample_demo
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt  # indien aanwezig
python3 sample_app.py
