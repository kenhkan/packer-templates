#!/usr/bin/env bash

sudo apt-get update

# Install essentials tools and libraries
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y wget

# Install [stack](http://www.stackage.org/)
wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
echo 'deb http://download.fpcomplete.com/ubuntu/trusty stable main'|sudo tee /etc/apt/sources.list.d/fpco.list
sudo apt-get update && sudo apt-get install stack -y

## Link ghc executables
#STACK_GHC_PATH=/home/vagrant/.stack/programs/x86_64-linux/ghc-7.8.4/bin
#BIN_PATH=/usr/bin
#sudo ln -s $STACK_GHC_PATH/ghc $BIN_PATH/ghc
#sudo ln -s $STACK_GHC_PATH/ghci $BIN_PATH/ghci
#sudo ln -s $STACK_GHC_PATH/ghc-pkg $BIN_PATH/ghc-pkg
#sudo ln -s $STACK_GHC_PATH/haddock $BIN_PATH/haddock
#sudo ln -s $STACK_GHC_PATH/hp2ps $BIN_PATH/hp2ps
#sudo ln -s $STACK_GHC_PATH/hpc $BIN_PATH/hpc
#sudo ln -s $STACK_GHC_PATH/hsc2hs $BIN_PATH/hsc2hs
#sudo ln -s $STACK_GHC_PATH/runghc $BIN_PATH/runghc
#sudo ln -s $STACK_GHC_PATH/runhaskell $BIN_PATH/runhaskell

# Install command-line binaries
stack install cabal-install

# Link cabal/stack libraries via PATH
cat >> ~/.bashrc <<EOF
export PATH=/home/vagrant/.local/bin:/home/vagrant/.stack/programs/x86_64-linux/ghc-7.8.4/bin:$PATH
EOF
export PATH=/home/vagrant/.local/bin:/home/vagrant/.stack/programs/x86_64-linux/ghc-7.8.4/bin:$PATH

# Set stack up
cd /vagrant
stack setup
