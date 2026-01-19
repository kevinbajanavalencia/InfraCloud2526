#!/usr/bin/env bash
set -euo pipefail

# Run from repo root (where .git exists)
if [[ ! -d ".git" ]]; then
  echo "ERROR: Run this from the repo root (folder containing .git)."
  exit 1
fi

# 1) Base dirs
mkdir -p portfolio docs tools

# 2) Git hygiene
cat > .gitignore <<'EOF'
.env
.env.*
*.env
__pycache__/
*.py[cod]
.ipynb_checkpoints/
.venv/
venv/
*/venv/
*/.venv/
*env/
*.db
*.sqlite
*.sqlite3
.DS_Store
Thumbs.db
EOF

cat > .env.example <<'EOF'
IOSXE_HOST=devnetsandboxiosxec9k.cisco.com
IOSXE_PORT=22
IOSXE_USER=<username>
IOSXE_PASS=<password>

RESTCONF_HOST=devnetsandboxiosxec9k.cisco.com
RESTCONF_USER=<username>
RESTCONF_PASS=<password>

NETCONF_HOST=devnetsandboxiosxec9k.cisco.com
NETCONF_PORT=830
NETCONF_USER=<username>
NETCONF_PASS=<password>

WEBEX_TOKEN=<your_webex_bearer_token>

DNAC_USER=devnetuser
DNAC_PASS=<password>
EOF

# 3) Folders per evaluatiecode (minimum set based on what you already have)
mkdir -p \
  portfolio/Js4_JSON_naar_YAML \
  portfolio/Dna_CatalystCenter_Sandbox \
  portfolio/N1_Netmiko_Show_Commands \
  portfolio/N3_RESTCONF_Lab_8_3_6 \
  portfolio/N4_NETCONF_Lab_8_3_7 \
  portfolio/An2_Ansible_Virtuele_Router \
  portfolio/As2_Ansible_Webserver_Apache \
  portfolio/Di2_Eigen_Docker_Image \
  portfolio/W1_Webex_Lab_8_6_7 \
  portfolio/W2_Webex_Spaces \
  portfolio/Ap4_API_Webforms \
  portfolio/Pv1_Venv_Slides_6_7 \
  portfolio/Pv2_Eigen_Venv_Experiment \
  portfolio/Pf1_Flask_Experiment_Slides \
  portfolio/Pf2_Login_Page_Lab_6_5_10 \
  portfolio/Pf3_Eigen_Microservice \
  portfolio/CP1_Cisco_Platforms_Spreadsheet \
  portfolio/_TO_DO_Missing_Experiments

echo "OK: portfolio/ docs/ tools/ + templates (.gitignore, .env.example) created."
echo "Next: copy your existing experiment files from 2526/ into the matching portfolio/ folders."
