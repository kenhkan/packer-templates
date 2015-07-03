#!/usr/bin/env bash

wget --output-document=cabal.config http://www.stackage.org/lts-2.15/cabal.config
cabal update

# Yesod
cabal install yesod-bin
