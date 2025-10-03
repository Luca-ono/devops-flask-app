#!/bin/bash

echo "--- [Step 1/5] Updating package lists ---"
sudo apt-get update -y

echo "--- [Step 2/5] Installing Python, PIP, and VENV ---"
sudo apt-get install -y python3 python3-pip python3-venv

# The /vagrant directory is a special shared folder that Vagrant creates.
# It links your project folder on your Mac to the VM.
APP_SOURCE="/vagrant/app.py"
APP_DEST="/home/vagrant/app"

echo "--- [Step 3/5] Setting up Flask application directory and code ---"
mkdir -p $APP_DEST
cp $APP_SOURCE $APP_DEST/

echo "--- [Step 4/5] Creating Python virtual environment and installing Flask ---"
python3 -m venv $APP_DEST/venv
# Activate the virtual environment and install Flask
source $APP_DEST/venv/bin/activate
pip3 install Flask

echo "--- [Step 5/5] Setting up systemd service to run Flask app on boot ---"
# Create a service file to manage the Flask app
cat <<EOF | sudo tee /etc/systemd/system/flaskapp.service
[Unit]
Description=My Automated Flask App
After=network.target

[Service]
User=vagrant
Group=vagrant
WorkingDirectory=$APP_DEST
ExecStart=$APP_DEST/venv/bin/python3 app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Enable and start the service so the app runs automatically
sudo systemctl daemon-reload
sudo systemctl enable flaskapp.service
sudo systemctl start flaskapp.service

echo "--- Setup complete! Flask app should be running. ---"