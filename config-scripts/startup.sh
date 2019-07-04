#!/bin/bash

curl https://raw.githubusercontent.com/otus-devops-2019-05/ilyapt_infra/17a89f06477ba597106a87b3968a8ea8dfe600ea/install_ruby.sh | bash
if [ $? -ne 0 ]; then
  echo "Failed to install ruby"
  exit 1
fi

curl https://raw.githubusercontent.com/otus-devops-2019-05/ilyapt_infra/17a89f06477ba597106a87b3968a8ea8dfe600ea/install_mongo.sh | bash
if [ $? -ne 0 ]; then
  echo "Failed to install mongo"
  exit 1
fi

curl https://raw.githubusercontent.com/otus-devops-2019-05/ilyapt_infra/17a89f06477ba597106a87b3968a8ea8dfe600ea/deploy.sh | bash
if [ $? -ne 0 ]; then
  echo "Failed to deploy app"
  exit 1
fi

