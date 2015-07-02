#!/usr/bin/env bash

# Haskell Toolbelt
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y cabal-install-1.20 ghc-7.8.4

# Link Cabal and GHC
cat >> /etc/bash.bashrc <<EOF
export PATH=~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:$PATH
EOF
export PATH=~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:$PATH

# Additional required libraries
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y wget

# Required Cabal binaries
wget --output-document=cabal.config http://www.stackage.org/lts-2.15/cabal.config
cabal update
cabal install alex happy

# Yesod
cabal install yesod-bin
