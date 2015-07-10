#!/usr/bin/env bash

# Add repository containing stack
wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
echo 'deb http://download.fpcomplete.com/ubuntu/trusty stable main' | sudo tee /etc/apt/sources.list.d/fpco.list

# Update repositories
sudo apt-get update

# Install essential tools and libraries
sudo apt-get install -y zlib1g-dev

# Install [stack](http://www.stackage.org/)
sudo apt-get install -y stack

# Get GHC
stack setup
