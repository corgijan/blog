#!/bin/bash

# Directory where your Git repository is located
REPO_DIR="~/blog"

# Navigate to the repository directory
cd "$REPO_DIR" || exit

# Fetch the latest changes from the remote repository
git fetch

# Check if there are any updates
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "Updates available. Pulling changes..."
    
    # Pull the latest changes
    git pull
    
    # Navigate to the directory containing the Docker Compose file (if different from the REPO_DIR)
    # cd /path/to/docker/compose

    echo "Stopping and removing Docker containers..."
    docker-compose down
    
    echo "Starting Docker containers..."
    docker-compose up -d
    
    echo "Update complete."
else
    echo "No updates available."
fi
