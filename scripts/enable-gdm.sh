#!/bin/bash

# Check if GDM is installed
if ! command -v gdm &>/dev/null; then
    echo "❌ GDM is not installed. Please install GDM first."
    exit 1
fi

# Enable GDM service
echo "Enabling GDM service..."
sudo systemctl enable gdm.service
if [ $? -eq 0 ]; then
    echo "✅ GDM service enabled successfully."
else
    echo "❌ Failed to enable GDM service."
    exit 1
fi

# Start GDM service
echo "Starting GDM service..."
sudo systemctl start gdm.service
if [ $? -eq 0 ]; then
    echo "✅ GDM service started successfully."
else
    echo "❌ Failed to start GDM service."
    exit 1
fi

# Set the default target to graphical
echo "Setting the default target to graphical..."
sudo systemctl set-default graphical.target
if [ $? -eq 0 ]; then
    echo "✅ Default target set to graphical."
else
    echo "❌ Failed to set the default target."
    exit 1
fi

echo "🎉 GDM has been enabled and set as the default display manager!"
