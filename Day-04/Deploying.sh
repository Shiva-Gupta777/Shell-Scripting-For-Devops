#!/bin/bash

# =========================================
# ERROR HANDLING
# =========================================
set -e
trap 'echo "❌ Error at line $LINENO. Exiting..."; exit 1' ERR

# =========================================
# VARIABLES
# =========================================
REPO_URL="https://github.com/Shiva-Gupta777/Chat_Bot.git"
APP_DIR="Chat_Bot"
IMAGE_NAME="chatbot-app"
CONTAINER_NAME="chatbot-container"

echo "🚀 Starting Deployment..."

# =========================================
# STEP 1: UPDATE SYSTEM
# =========================================
echo "Updating system..."
sudo apt update -y

# =========================================
# STEP 2: INSTALL DOCKER
# =========================================
echo "Installing Docker..."
sudo apt install docker.io -y

# Restart and enable Docker service

sudo systemctl start docker
sudo systemctl enable docker

# =========================================
# STEP 3: CLONE REPOSITORY
# =========================================
echo "Cloning repository..."

if [ -d "$APP_DIR" ]; then
  echo "Removing old project..."
  rm -rf $APP_DIR
fi

git clone $REPO_URL

# =========================================
# STEP 4: COPY DOCKERFILE
# =========================================
cp Dockerfile $APP_DIR/
cd $APP_DIR

# =========================================
# STEP 5: BUILD DOCKER IMAGE
# =========================================
echo "Building Docker image..."
sudo docker build -t $IMAGE_NAME .

# =========================================
# STEP 6: REMOVE OLD CONTAINER (if exists)
# =========================================
sudo docker stop $CONTAINER_NAME || true
sudo docker rm $CONTAINER_NAME || true

# =========================================
# STEP 7: RUN CONTAINER
# =========================================
echo "Running container..."
sudo docker run -d -p 80:80 --name $CONTAINER_NAME $IMAGE_NAME

# =========================================
# DONE
# =========================================
echo "🎉 Deployment Successful!"
