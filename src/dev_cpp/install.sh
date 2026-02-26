#!/usr/bin/env bash
set -e

CLANGD_VERSION="21.1.8"
CLANGD_ARCH="linux"
CLANGD_RELEASE_URL="https://github.com/clangd/clangd/releases/download/${CLANGD_VERSION}/clangd-${CLANGD_ARCH}-${CLANGD_VERSION}.zip"
CLANGD_ARCHIVE_NAME="clangd-${CLANGD_ARCH}-${CLANGD_VERSION}.zip"
CLANGD_DIR_NAME="clangd-${CLANGD_ARCH}-${CLANGD_VERSION}"

apt-get update && \
    apt-get install -y --no-install-recommends \
    curl ca-certificates unzip

cd /tmp
curl -LO $CLANGD_RELEASE_URL
unzip ${CLANGD_ARCHIVE_NAME} -d ${CLANGD_DIR_NAME}_extracted
mkdir /opt/clangd
mv ${CLANGD_DIR_NAME}_extracted/*/* /opt/clangd

rm ${CLANGD_ARCHIVE_NAME}
rm -rf ${CLANGD_DIR_NAME}_extracted

ln -s /opt/clangd/bin/clangd /usr/local/bin
