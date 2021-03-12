#!/bin/bash

# apt-get install curl software-properties-common
curl -sL https://deb.nodesource.com/setup_15.x | bash - && apt-get install -y nodejs && node -v && npm -v && npm install pm2@latest -g

## Run `apt-get install -y nodejs` to install Node.js 15.x and npm

## You may also need development tools to build native addons:
apt-get install -y gcc g++ make

## To install the Yarn package manager, run:
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && apt-get update && apt-get upgrade && apt-get install -y yarn && yarn --version