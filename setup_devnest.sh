#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if requirements/dev.txt exists
if [[ ! -f requirements/dev.txt ]]; then
    echo "requirements/dev.txt not found!"
    exit 1
fi

# Create a virtual environment (optional but recommended)
echo "Creating virtual environment..."
python3 -m venv venv

# Activate the virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip to the latest version
echo "Upgrading pip..."
pip install --upgrade pip

# Install dependencies from requirements/dev.txt
echo "Installing dependencies from requirements/dev.txt..."
pip install -r requirements/dev.txt

# Create the Django project
echo "Creating Django project named 'devnest'..."
django-admin startproject devnest .

# Change into the project directory
cd devnest

# Create the Django app named 'api'
echo "Creating Django app named 'api'..."
django-admin startapp api

echo "Setup complete! Your Django project 'devnest' with the app 'api' has been created."
