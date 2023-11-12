#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $SCRIPT_DIR

source ./config/config.conf

$JAVA_HOME/bin/java $JAVA_OPTS -jar ${JAR_NAME} $@ &
PID=$!
echo $PID | tee java-pid

