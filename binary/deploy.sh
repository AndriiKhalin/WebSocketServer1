#!/bin/bash

APP_DIR=/home/andriikhalin/University/AUX-OC/LB1/WebSocketServer/WebSocketServer/bin/Release/net7.0
APP_NAME=AspNetServer

if [ "$1" = "deploy" ]; then
  echo "Deploying $APP_NAME..."

  # Start the app
  systemctl start $APP_NAME.service

  echo "Done."
elif [ "$1" = "undeploy" ]; then
  echo "Undeploying $APP_NAME..."

  # Stop the app if it's running
  systemctl stop $APP_NAME.service

  echo "Done."
else
  echo "Usage: deploy.sh [deploy|undeploy]"
fi
