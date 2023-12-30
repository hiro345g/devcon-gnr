#!/bin/sh
BASE_DIR=$(cd $(dirname $0)/..;pwd)
DEV_DIR=${BASE_DIR}/dev
DIST_DIR=${BASE_DIR}/devcon-gnr-mozc
VERSION=1.1

if [ ! -e ${DEV_DIR}/devcon-gnr ]; then
  cd ${DEV_DIR}/
  wget https://github.com/hiro345g/devcon-gnr/archive/refs/tags/${VERSION}.zip
  unzip ${DEV_DIR}/${VERSION}.zip
  mv ${DEV_DIR}/devcon-gnr-${VERSION} ${DEV_DIR}/devcon-gnr
  rm ${DEV_DIR}/${VERSION}.zip
fi
if [ ! -e ${DIST_DIR}/.devcontainer ]; then mkdir -p ${DIST_DIR}/.devcontainer; fi
if [ ! -e ${DIST_DIR}/workspace_share ]; then mkdir -p ${DIST_DIR}/workspace_share; fi
cp -r ${DEV_DIR}/devcon-gnr/.devcontainer/* ${DIST_DIR}/.devcontainer/
cp -r ${DEV_DIR}/devcon-gnr/docker-compose.yml ${DIST_DIR}/
sed -i 's/devcon-gnr/devcon-gnr-mozc/' ${DIST_DIR}/.devcontainer/devcontainer.json
sed -i 's/devcon-gnr/devcon-gnr-mozc/' ${DIST_DIR}/docker-compose.yml

rm -fr ${DEV_DIR}/devcon-gnr
