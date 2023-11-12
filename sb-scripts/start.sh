#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $SCRIPT_DIR

./status.sh > /dev/null

if [ $0 == 110 ]; then
  echo "Process $(cat java-pid) is already running"
  exit 1
fi

nohup ./run-java.sh > startup.out 2> startup.err < /dev/null &
