# W2 – Webex spaces creëren en verwijderen

## Doel
Via de Webex API spaces beheren (create/delete) als automation oefening.

## Context
- Tooling: Jupyter Notebook / Python
- API: Webex REST API
- Bestand: `webex_update.ipynb`

## Werkwijze (kort)
1. Webex token/config instellen (via `.env` of variabele in notebook).
2. Space(s) aanmaken via API call.
3. Space(s) verwijderen via API call.
4. Output/response codes controleren.

## Run (voorbeeld)
Open `webex_update.ipynb` en run de cellen stap voor stap.

## Resultaat / bewijs
- API responses met successtatus (201/204 of gelijkaardig).
- Aangemaakte spaces zichtbaar in Webex UI.

## Reflectie
- Tokens moeten uit Git blijven (gebruik `.env`).
- API rate limits en foutafhandeling zijn belangrijk.
