#!/usr/bin/env bash

# Haskell Toolbelt
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y cabal-install-1.20 ghc-7.8.4

# Link Cabal and GHC statically
CABAL_PATH=/opt/cabal/1.20/bin
GHC_PATH=/opt/ghc/7.8.4/bin
sudo ln -s $CABAL_PATH/cabal /usr/bin/cabal
sudo ln -s $GHC_PATH/ghc /usr/bin/ghc
sudo ln -s $GHC_PATH/ghci /usr/bin/ghci
sudo ln -s $GHC_PATH/ghc-pkg /usr/bin/ghc-pkg
sudo ln -s $GHC_PATH/haddock /usr/bin/haddock
sudo ln -s $GHC_PATH/hp2ps /usr/bin/hp2ps
sudo ln -s $GHC_PATH/hpc /usr/bin/hpc
sudo ln -s $GHC_PATH/hsc2hs /usr/bin/hsc2hs
sudo ln -s $GHC_PATH/runghc /usr/bin/runghc
sudo ln -s $GHC_PATH/runhaskell /usr/bin/runhaskell

# Still link Cabal libraries via PATH
cat >> /etc/bash.bashrc <<EOF
export PATH=~/.cabal/bin:$PATH
EOF
export PATH=~/.cabal/bin:$PATH

# Additional required libraries
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y wget
