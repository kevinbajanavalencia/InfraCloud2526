# As2 – Eigen playbook-experiment met webserver (Apache)

## Doel
Een Linux webserver automatisch installeren en beheren met Ansible (install/start/stop/remove + verificatie).

## Context
- Tooling: Ansible
- Target: Linux VM (inventory: `hosts`)
- Bestanden: playbooks + `files/index.html`

## Werkwijze (kort)
1. Inventory aanpassen in `hosts` (IP/SSH user).
2. Playbook runnen (install/start/stop/remove).
3. Verifiëren via `verify_apache_installation.yaml` of via browser/curl.

## Run (voorbeelden)
```bash
ansible-playbook -i hosts install_apache_playbook.yaml
ansible-playbook -i hosts start_apache_playbook.yaml
ansible-playbook -i hosts verify_apache_installation.yaml

