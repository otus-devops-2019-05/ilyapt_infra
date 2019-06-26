#!/bin/bash

git clone -b monolith https://github.com/express42/reddit.git
if [ $? -ne 0 ]; then
  echo "Failed to clone repository"
  exit 1
fi

cd reddit && bundle install
if [ $? -ne 0 ]; then
  echo "Failed to install dependencies"
  exit 1
fi

puma -d
if [ $? -ne 0 ]; then
  echo "Failed to run service"
  exit 1
fi
