# Wazuh Agent Installation Scripts
 
This repository provides installation scripts for the Wazuh agent on various platforms, including Windows, Linux, and macOS. You can use these scripts to easily deploy and configure the Wazuh agent for security monitoring and intrusion detection.
 
## What is Wazuh Agent?
 
The Wazuh agent is an integral part of the Wazuh open-source security monitoring platform. It collects log data, analyzes security events, and forwards information to a centralized Wazuh manager, enabling you to monitor and respond to security threats effectively.
 
## Links to Scripts
 
- [Windows Installation (PowerShell)](Windows/)
- [Linux Installation (Bash)](Linux/)
- [macOS Installation (Bash)](macOS/)
 
## Installation Process
 
### Windows (PowerShell)
 
To install the Wazuh agent on Windows using PowerShell:
 
1. Download the [Windows installation script](Windows/).
 
2. Open a PowerShell window as an administrator.
 
3. Move to place where script is stored.
 
4. Run the following command to execute the script:
 
```powershell
Set-ExecutionPolicy Bypass; .\"Install Agent.ps1"
 
```
### Linux (Bash)
 
To install the Wazuh agent on Linux using Bash:
 
1. Download the [Linux installation script](Linux/).
 
2. Open terminal as root.
 
3. Move to place where script is stored.
 
4. Run the following command to execute the script:
```Shell
  chomod +x Install_Agent.sh
  ./Install_Agent.sh
```
 
### macOS
 
Will come soon
