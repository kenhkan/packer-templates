#!/usr/bin/env bash

sudo apt-get update

# Install node.js
sudo apt-get install -y nodejs
sudo apt-get install -y npm

# Link node.js because of name conflict in apt
sudo cp /usr/bin/nodejs /usr/bin/node
