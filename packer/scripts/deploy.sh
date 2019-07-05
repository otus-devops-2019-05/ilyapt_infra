#!/bin/bash

git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
sudo mv /tmp/reddit-daemon.service /etc/systemd/system/
sudo chmod 664 /etc/systemd/system/reddit-daemon.service
sudo systemctl enable reddit-daemon
