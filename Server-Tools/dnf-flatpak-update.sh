#Simple update script for dnf and flatpak repositories (Standard in most RHEL environments)
#!/bin/bash
echo "Updating dnf and flatpak repositories.."
sudo dnf update && dnf upgrade
sudo flatpak update && flatpak upgrade
echo "All repositories updated."
