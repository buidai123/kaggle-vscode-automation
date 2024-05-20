# VSCode Kaggle Setup

This repository contains the necessary scripts and configuration files to quickly set up a personalized VSCode environment in Kaggle notebooks.

## Repository Contents
- `setup_code_server.sh`: The main script to set up VSCode (`code-server`), install necessary extensions, and apply user settings.
- `extensions.txt`: A list of VSCode extensions to be installed.
- `settings_backup.json`: User settings for VSCode.

## How to Use

**Quick use**
```python
!git clone https://github.com/buidai123/kaggle-vscode-automation.git /kaggle/working/vscode-kaggle-setup
!ls /kaggle/working/vscode-kaggle-setup
%cd /kaggle/working/vscode-kaggle-setup
!chmod +x setup_code_server.sh
!./setup_code_server.sh
```
**Export setting and extension to the current directory**

if you wanna setup your own settings and extensions just change it then export it put it in github repo
```python
cp ~/.local/share/code-server/User/settings.json ./settings.json
code-server --list-extensions > ./extensions-list.txt
```

Follow these steps to set up your VSCode environment in a new Kaggle notebook instance.

### 1. Open a Kaggle Notebook

Start a new notebook instance on the Kaggle platform.

### 2. Clone This Repository

Run the following command to clone the repository containing the setup script and configuration files.
```python
#Clone the GitHub repository containing the setup script
!git clone https://github.com/buidai123/kaggle-vscode-automation.git /kaggle/working/vscode-kaggle-setup
#Verify the files are downloaded
!ls /kaggle/working/vscode-kaggle-setup
```
### 3. Change Directory to the Cloned Repository

Navigate to the directory where the repository was cloned.
```python

#Change directory to the cloned repository
%cd /kaggle/working/vscode-kaggle-setup
```

### 4. Make the Setup Script Executable

Ensure the script has executable permissions.
```python
#Make the setup script executable
!chmod +x setup_code_server.sh

```

### 5. Run the Setup Script

Execute the setup script to install `code-server`, set up configurations, restore extensions and user settings, and start `code-server` with an `ngrok` tunnel.
```python

#Run the setup script
!./setup_code_server.sh
```

### 6. Access Your VSCode Environment

Once the setup script finishes, it will output a `ngrok` URL. Open this URL in your browser to access your customized VSCode environment.

## Customizing Extensions and Settings

You can modify `extensions.txt` and `settings_backup.json` to add or change the extensions and settings according to your preference. After modifying these files, commit the changes to your GitHub repository to keep them updated.

### `extensions.txt`

Add the ID of any VSCode extensions you want to install. Here is an example of what `extensions.txt` might look like:
`ms-python.python ms-toolsai.jupyter GitHub.github-vscode-theme`

### `settings_backup.json`

Customize your VSCode settings in this JSON file. Here is an example configuration:

## Notes

- Ensure you replace `"YOUR_NGROK_AUTH_TOKEN"` in the `setup_code_server.sh` script with your actual ngrok authentication token.
- Update your GitHub repository URL correctly in the Kaggle notebook commands.

With this setup, you will have a personalized VSCode environment ready to use in your Kaggle notebooks each time you start a new instance.

## Support

If you encounter any issues or have questions, feel free to open an issue in this repository or contact me directly.

Enjoy your customized VSCode environment on Kaggle!

