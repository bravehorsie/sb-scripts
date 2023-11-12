#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $SCRIPT_DIR

JAVA_PID=`cat ./java-pid`
echo "Stopping ${JAVA_PID}"
kill $JAVA_PID
TIMEOUT=15
COUNT=0

while [ $COUNT -le $TIMEOUT ]
do
  if ! pgrep -F "./java-pid" > /dev/null
  then 
    break
  fi
  echo "Waiting to stop.."
  sleep 1    
done

if pgrep -F java-pid
then
  echo "Can't stop gracefully."
  exit 1
else
  echo "Stopped."
  exit 0
fi
