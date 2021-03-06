#!/bin/bash
set -x

DCE_VER=2.6.1

CONTROLLER="daocloud.io/daocloud/dce-controller:$DCE_VER"
SWARM="daocloud.io/daocloud/dce-swarm:$DCE_VER"
AGENT="daocloud.io/daocloud/dce-agent:$DCE_VER"
ETCD="daocloud.io/daocloud/dce-etcd:$DCE_VER"
DCE="daocloud.io/daocloud/dce:$DCE_VER"

IMAGES="$CONTROLLER $SWARM $AGENT $ETCD $DCE"

echo  -e "\033[32m Pulling images... \033[0m"
for i in $IMAGES
do 
	docker pull $i
done

echo  -e "\033[32m Building... \033[0m"
OLD_ID=$(docker images -q $CONTROLLER)
docker tag $OLD_ID "daocloud.io/daocloud/dce-controller:bak"
docker build -t $CONTROLLER .

echo  -e "\033[32m Packing... \033[0m"
NEW_ID=$(docker images -q $CONTROLLER)
docker save $IMAGES | gzip > lenovo-dce-$DCE_VER.tar.gz


echo  -e "\033[32m Clean up... \033[0m"
docker rmi $NEW_ID
docker tag $OLD_ID $CONTROLLER
docker rmi "daocloud.io/daocloud/dce-controller:bak"
