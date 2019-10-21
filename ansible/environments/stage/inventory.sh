#!/bin/bash

if [ "$1" == "--list" ] ; then
APP_IP=`(cd ../terraform/stage/ && terraform output -json app_external_ip | jq '.value')`
DB_IP=`(cd ../terraform/stage/ && terraform output -json db_external_ip | jq '.value')`
MONGO=`(cd ../terraform/stage/ && terraform output -json db_ip | jq '.value')`
cat << EOF
{
    "app": {
      "hosts": [${APP_IP}]
    },
    "db": {
      "vars": { "mongo": ${MONGO} },
      "hosts": [${DB_IP}]
    }
}
EOF
else
  echo "{}"
fi
