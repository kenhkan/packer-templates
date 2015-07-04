#!/usr/bin/env bash

## Haskell Toolbelt
#sudo apt-get install -y software-properties-common
#sudo add-apt-repository -y ppa:hvr/ghc
#sudo apt-get update
#sudo apt-get install -y cabal-install-1.20 ghc-7.8.4

## Link Cabal and GHC statically
#CABAL_PATH=/opt/cabal/1.20/bin
#GHC_PATH=/opt/ghc/7.8.4/bin
#sudo ln -s $CABAL_PATH/cabal /usr/bin/cabal
#sudo ln -s $GHC_PATH/ghc /usr/bin/ghc
#sudo ln -s $GHC_PATH/ghci /usr/bin/ghci
#sudo ln -s $GHC_PATH/ghc-pkg /usr/bin/ghc-pkg
#sudo ln -s $GHC_PATH/haddock /usr/bin/haddock
#sudo ln -s $GHC_PATH/hp2ps /usr/bin/hp2ps
#sudo ln -s $GHC_PATH/hpc /usr/bin/hpc
#sudo ln -s $GHC_PATH/hsc2hs /usr/bin/hsc2hs
#sudo ln -s $GHC_PATH/runghc /usr/bin/runghc
#sudo ln -s $GHC_PATH/runhaskell /usr/bin/runhaskell

sudo apt-get update

# Still link Cabal libraries via PATH
cat >> ~/.bashrc <<EOF
export PATH=~/.cabal/bin:$PATH
EOF
export PATH=~/.cabal/bin:$PATH

cat >> ~/.bashrc <<EOF
export PATH=/home/vagrant/.local/bin:/home/vagrant/.stack/programs/x86_64-linux/ghc-7.8.4/bin:$PATH
EOF
export PATH=/home/vagrant/.local/bin:/home/vagrant/.stack/programs/x86_64-linux/ghc-7.8.4/bin:$PATH

# Additional required libraries
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y wget

sudo apt-get install -y postgresql-9.3
sudo apt-get install -y libpq-dev

# Set up Postgres
TEMP_FILE=.postgres.sql
cat <<'EOF' > $TEMP_FILE
CREATE USER vagrant WITH PASSWORD 'vagrant';
CREATE DATABASE vagrant;
GRANT ALL PRIVILEGES ON DATABASE vagrant TO vagrant;
\q
EOF
sudo -u postgres psql -f $TEMP_FILE
rm $TEMP_FILE

#cabal install yesod-bin


# Stack
wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
echo 'deb http://download.fpcomplete.com/ubuntu/trusty stable main'|sudo tee /etc/apt/sources.list.d/fpco.list
sudo apt-get update && sudo apt-get install stack -y

STACK_GHC_PATH=/home/vagrant/.stack/programs/x86_64-linux/ghc-7.8.4/bin
BIN_PATH=/usr/bin
sudo ln -s $STACK_GHC_PATH/ghc $BIN_PATH/ghc
sudo ln -s $STACK_GHC_PATH/ghci $BIN_PATH/ghci
sudo ln -s $STACK_GHC_PATH/ghc-pkg $BIN_PATH/ghc-pkg
sudo ln -s $STACK_GHC_PATH/haddock $BIN_PATH/haddock
sudo ln -s $STACK_GHC_PATH/hp2ps $BIN_PATH/hp2ps
sudo ln -s $STACK_GHC_PATH/hpc $BIN_PATH/hpc
sudo ln -s $STACK_GHC_PATH/hsc2hs $BIN_PATH/hsc2hs
sudo ln -s $STACK_GHC_PATH/runghc $BIN_PATH/runghc
sudo ln -s $STACK_GHC_PATH/runhaskell $BIN_PATH/runhaskell

#cd /vagrant
#stack setup
#stack install yesod-bin
#stack build

# Stack support for yesod:
# http://www.yesodweb.com/blog/2015/06/stack-support-yesod-devel
stack install yesod-bin-1.4.11 cabal-install
#stack build yesod-bin-1.4.11 .
#stack exec yesod devel
