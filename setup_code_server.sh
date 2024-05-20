
#!/bin/bash

# Check if NGROK_AUTH_TOKEN is set
if [ -z "$NGROK_AUTH_TOKEN" ]; then
  echo "The NGROK_AUTH_TOKEN environment variable is missing"
  exit 1
fi

# Step 1: Install code-server
curl -fsSL https://code-server.dev/install.sh | sh

# Step 2: Generate a code-server configuration with a secure random password
config_content=$(cat <<EOF
bind-addr: 127.0.0.1:8080
auth: password
password: $(openssl rand -base64 32)
cert: false
EOF
)

mkdir -p ~/.config/code-server
echo "$config_content" > ~/.config/code-server/config.yaml

# Print configuration for verification
cat ~/.config/code-server/config.yaml

# Step 3: Install pyngrok and set up the tunnel
pip install pyngrok

# Python script to set up ngrok tunnel and apply extensions and settings from GitHub
python3 - << EOF
import os
import time
from pyngrok import conf, ngrok

# Set ngrok auth token
conf.get_default().auth_token = $NGROK_AUTH_TOKEN

echo "Ngrok authentication setup with authtoken"

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

