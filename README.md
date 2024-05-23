# Kaggle VSCode Automation

This repository provides an automated setup for connecting and working with Kaggle notebooks using VSCode Code-Server in the browser for a seamless development experience.

## Table of Contents
1. [Introduction](#introduction)
2. [How to Use](#how-to-use)
    - [Quick Setup](#quick-setup)
    - [Detailed Setup Steps](#detailed-setup-steps)
3. [Customizing Extensions and Settings](#customizing-extensions-and-settings)
4. [Troubleshooting](#troubleshooting)
5. [Contribution](#contribution)
6. [Contact](#contact)
7. [License](#license)
8. [Related Project](#related-project)

## Introduction

The Kaggle VSCode Automation repository provides a straightforward and efficient approach to integrate Kaggle notebook interactions within the VSCode Code-Server environment. Ideal for developers and data scientists who prefer the flexibility and robustness of the VSCode interface, this setup automates the process of connecting to Kaggle, enhancing productivity with a browser-based VSCode environment.

## How to Use

### Quick Setup

Run the following commands in your Kaggle notebook to set everything up:
```python
!git clone https://github.com/buidai123/kaggle-vscode-automation.git /kaggle/working/vscode-kaggle-setup
!ls /kaggle/working/vscode-kaggle-setup
%cd /kaggle/working/vscode-kaggle-setup
!chmod +x setup_code_server.sh
import os
os.environ["NGROK_AUTH_TOKEN"] = "YOUR_NGROK_AUTHTOKENT"
!./setup_code_server.sh
```
Make sure to replace `"YOUR_NGROK_AUTH_TOKEN"` with your actual ngrok authentication token.

### Detailed Setup Steps


Follow these steps to set up your VSCode environment in a new Kaggle notebook instance:

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

### 5. Initialize Environment Variable
```python
import os
os.environ["NGROK_AUTH_TOKEN"] = "YOUR_NGROK_AUTHTOKENT"
```

### 6. Run the Setup Script

Execute the setup script to install `code-server`, set up configurations, restore extensions and user settings, and start `code-server` with an `ngrok` tunnel.
```python

#Run the setup script
!./setup_code_server.sh
```

### 7. Access Your VSCode Environment

Once the setup script finishes, it will output a `ngrok` URL. Open this URL in your browser to access your customized VSCode environment.

## Customizing Extensions and Settings

You can modify `extensions.txt` and `settings_backup.json` to add or change the extensions and settings according to your preference. After modifying these files, commit the changes to your GitHub repository to keep them updated.

### Export Setting and Extension to the Current Directory

If you want to set up your own settings and extensions, just change them, then export them and push them back to the GitHub repository.

```python
cp ~/.local/share/code-server/User/settings.json ./settings.json
code-server --list-extensions > ./extensions-list.txt
```

#### extensions.txt

Add the ID of any VSCode extensions you want to install. Here is an example of what `extensions.txt` might look like:
`ms-python.python ms-toolsai.jupyter GitHub.github-vscode-theme`

### `settings_backup.json`

Customize your VSCode settings in this JSON file. Here is an example configuration:

#### settings_backup.json

Customize your VSCode settings in this JSON file. Here is an example configuration:

```json
 {
     "editor.fontSize": 14, 
     "python.pythonPath": "/usr/bin/python3",
     "workbench.colorTheme": "GitHub Dark"
 }
```

## Notes

- Ensure you replace `"YOUR_NGROK_AUTH_TOKEN"` with your actual ngrok authentication token.
<img src="https://github.com/buidai123/kaggle-vscode-automation/assets/140616004/b25c0f22-c232-4ec4-9f91-10eb0627d7df" alt="image" width="500"/>

- Open the Public URL and then click `visit site` then paste the password displayed as above


With this setup, you will have a personalized VSCode environment ready to use in your Kaggle notebooks each time you start a new instance.

## Troubleshooting

### Common Issues

- **Connectivity Problems**: Ensure Docker is running and your network settings allow access to `localhost:8080`.
- **Extension Installation Failures**: Verify that your Docker container has internet access.
- **API Key Errors**: Double-check that your Kaggle API key is correctly set up and placed in the appropriate configuration file.

## Contribution

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or create a pull request.

## Contact

If you have any questions or need further assistance, feel free to reach out:
Email: ss1280dzzz@gmail.com

For more details or issues, refer to the GitHub issues page or contact us.

## License

This project is licensed under the Apache-2.0 License - see the LICENSE file for details.

## Related Project

If you find this project useful, you might also be interested in another related project that works with VSCode Desktop:

- [Kaggle VSCode Remote SSH](https://github.com/buidai123/Kaggle_VSCode_Remote_SSH): This repository provides a detailed guide on setting up SSH access to Kaggle notebooks using ngrok and integrating it with VSCode Desktop.

