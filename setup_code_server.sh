#!/bin/bash

# Step 1: Install code-server
curl -fsSL https://code-server.dev/install.sh | sh -s -- --version 4.89.1

# Step 2: Generate a code-server configuration with a secure random password
python3 - <<EOF
import os
import secrets
import base64

# Generate a code-server configuration with a secure random password
config_content = """
bind-addr: 127.0.0.1:8080
auth: password
password: {}
cert: false
"""

# Generate a random base64 encoded password
random_password = base64.urlsafe_b64encode(secrets.token_bytes(24)).decode('utf-8')

# Write the configuration content
os.makedirs('/root/.config/code-server', exist_ok=True)
with open('/root/.config/code-server/config.yaml', 'w') as config_file:
    config_file.write(config_content.format(random_password))

# Verify the configuration file
print("Configuration file content:")

EOF

# Print configuration for verification
cat ~/.config/code-server/config.yaml

# Step 3: Install pyngrok and set up the tunnel
pip install pyngrok

# Python script to set up ngrok tunnel and apply extensions and settings from GitHub
python3 - << EOF
import os
import time
from pyngrok import conf, ngrok

# Fetch the ngrok auth token from the environment variable
auth_token = os.getenv("NGROK_AUTH_TOKEN")
if not auth_token:
    raise ValueError("NGROK_AUTH_TOKEN is not set in the environment")

# Set ngrok auth token from the environment variable
conf.get_default().auth_token = auth_token

# Establish the ngrok tunnel for port 8080
http_tunnel = ngrok.connect()
print(f"Public URL: {http_tunnel.public_url}")

# Wait a bit to ensure code-server starts
time.sleep(5)

# Restore extensions
extensions_file = '/kaggle/working/vscode-kaggle-setup/extensions.txt'
if os.path.exists(extensions_file):
    with open(extensions_file, 'r') as f:
        extensions = f.read().splitlines()
    for extension in extensions:
        os.system(f"code-server --install-extension {extension}")

# Restore user settings
settings_backup_file = '/kaggle/working/vscode-kaggle-setup/settings_backup.json'
if os.path.exists(settings_backup_file):
    settings_dir = os.path.expanduser("~/.local/share/code-server/User")
    os.makedirs(settings_dir, exist_ok=True)
    os.system(f"cp {settings_backup_file} {settings_dir}/settings.json")

# Verify installed extensions and settings
os.system("code-server --list-extensions")
os.system("cat ~/.local/share/code-server/User/settings.json")

# Start code-server
os.system("code-server --port 80")
EOF

