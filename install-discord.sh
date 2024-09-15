#!/bin/bash
cd /opt/ || { echo "Failed to change directory to /opt/"; exit 1; }

echo "Deleting old installation..."
sudo rm -rf Discord/
echo "Deleted!"

if [ -d ~/Documents/Discord ]; then
    echo "Moving new version to /opt/"
    if sudo mv ~/Documents/Discord /opt/; then
        echo "Success"
    else
        echo "Failed to move the new version. Make sure you have extracted the tar.gz to ~/Documents/."
    fi
else
    echo "Error: ~/Documents/Discord does not exist. Please make sure you have extracted the files."
fi

# Ask user if they want to install Vencord
read -p "Would you like to launch the Vencord installer? (y/n): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Launching Vencord installer..."
    sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
    echo "Completed!"
else
    echo "Installation skipped."
fi
