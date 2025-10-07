#Simple Auto Updater for RHEL environments
#!/bin/bash
echo "Updating dnf and flatpak repositories.."
sudo dnf update && dnf upgrade
sudo flatpak update && flatpak upgrade
echo "All repositories updated."
