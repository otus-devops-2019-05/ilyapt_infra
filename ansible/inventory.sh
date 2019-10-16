#!/bin/bash

if [ "$1" == "--list" ] ; then
#APP_IP=`(cd ../terraform/stage/ && terraform output -json app_external_ip | jq '.value')`
#DB_IP=`(cd ../terraform/stage/ && terraform output -json db_external_ip | jq '.value')`
cat << EOF
{
    "app": {
      "hosts": ["34.77.99.227"]
    },
    "db": {
      "hosts": ["35.240.24.91"]
    }
}
EOF
else
  echo "{}"
fi
