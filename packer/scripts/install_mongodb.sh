#!/bin/bash

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
  bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
if [ $? -ne 0 ]; then
  echo "Failed to add mongodb repository"
  exit 1
fi

apt update
if [ $? -ne 0 ]; then
  echo "Failed to update index"
  exit 1
fi

apt install -y mongodb-org
if [ $? -ne 0 ]; then
  echo "Failed to install mongodb"
  exit 1
fi

systemctl start mongod && systemctl enable mongod
if [ $? -ne 0 ]; then
  echo "Failed to enable and start mongodb"
  exit 1
fi

