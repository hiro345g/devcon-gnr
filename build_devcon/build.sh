#! /bin/sh
VERSION=1.1
IMAGE_NAME=devcon-gnr:${VERSION}
BUILD_DEVCON_DIR=$(cd $(dirname $0);pwd)
WS_SCRIPT_DIR=$(cd ${BUILD_DEVCON_DIR}/../workspace_share/script/;pwd)
CDGM_FILE=${WS_SCRIPT_DIR}/create-devcon-gnr-mozc.sh
PATH=${PATH}:${NPM_CONFIG_PREFIX}/bin

cd ${BUILD_DEVCON_DIR}
npm exec --package=@devcontainers/cli -- \
    devcontainer build --workspace-folder ./ --image-name ${IMAGE_NAME} --no-cache

if [ -e ${CDGM_FILE} ]; then
    sed -i -e "s/^VERSION=[0-9]*\.[0-9]*/VERSION=${VERSION}/" ${CDGM_FILE}
fi
