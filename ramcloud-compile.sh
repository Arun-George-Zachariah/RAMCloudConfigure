#!/bin/bash

ID="$1"
SHARED_DIR="/proj/nosql-json-PG0/"
echo ">> RAMCLOUD CONFIGURE"

echo "\t ## CONFIG AND COMPILE RAMCLOUD LOCAL"
echo "\t ## DOWNLOADING RAMCLOUD (latest) and RAMCloudServices"
git clone https://github.com/PlatformLab/RAMCloud.git $HOME/RAMCloud
git clone https://github.com/debarron/RAMCloudServices.git $HOME/rc-services

mv $HOME/rc-services/conf $HOME/RAMCloud
mv $HOME/rc-services/sbin $HOME/RAMCloud 

mkdir $HOME/RAMCloud/zookeeper
cd $HOME/RAMCloud

echo "\t ## DOWNLOADING ZOOKEEPER (version 3.4.14)"
wget http://mirrors.sonic.net/apache/zookeeper/zookeeper-3.4.14/zookeeper-3.4.14.tar.gz
tar -xvf zookeeper-3.4.14.tar.gz -C zookeeper --strip-components 1
rm zookeeper-3.4.14.tar.gz

echo "\t ## COMPILINT RAMCloud ... This will take time"
git submodule update --init --recursive
ln -s ../../hooks/pre-commit .git/hooks/pre-commit
make -j12

cp -r $HOME/RAMCloud "$SHARED_DIR/RAMCloud_$ID"
rm -Rf $HOME/RAMCloud
rm -Rf $HOME/rc-services

exit 0
