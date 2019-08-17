#!/bin/bash

MACHINES="$1"
USER_NAME="$2"
PRIVATE_KEY="$3"

echo ">> CONFIGURING RAMCLOUD WITH MACHINES: $MACHINES"

./set-ramcloud-dependencies.sh $MACHINES $USER_NAME $PRIVATE_KEY
./set-ramcloud-compile.sh $MACHINES $USER_NAME $PRIVATE_KEY
./set-ramcloud-configure.sh $MACHINES $USER_NAME $PRIVATE_KEY
./set-ramcloud-install.sh $MACHINES $USER_NAME $PRIVATE_KEY
./set-zookeeper-service.sh $MACHINES $USER_NAME $PRIVATE_KEY

echo -e ">> SETUP FINISHED 🌮"
exit 0
