#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $SCRIPT_DIR

PORT=`sed -n 's/server\.port=//p' config/application-*.properties`
AUTH_USER=`sed -n 's/auth\.username=//p' config/application-*.properties`
AUTH_PASS=`sed -n 's/auth\.password=//p' config/application-*.properties`
JAR_NAME=`sed -n 's/JAR_NAME=//p' config/config.conf`
ENDPOINT=https://localhost:$PORT
echo "Connecting to: $ENDPOINT"
AUTH_ARGS="--insecure -u $AUTH_USER:$AUTH_PASS"
RESPONSE=`curl $AUTH_ARGS -X GET -H "Content-Type: application/json" ${ENDPOINT}/actuator/health 2>/dev/null`

if [[ $RESPONSE == '{"status":"UP"}' ]]; then
  echo "$JAR_NAME endpoint is UP!"
  exit 0
else 
  echo "$JAR_NAME endpoint is DOWN!"
  exit 100
fi

