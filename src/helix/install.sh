#!/bin/bash
set -e

HELIX_VERSION="25.07.1"
HELIX_ARCH="x86_64-linux"
HELIX_DIR_NAME="helix-${HELIX_VERSION}-${HELIX_ARCH}"
HELIX_ARCHIVE_NAME="${HELIX_DIR_NAME}.tar.xz"
HELIX_RELEASE_URL="https://github.com/helix-editor/helix/releases/download/${HELIX_VERSION}/${HELIX_ARCHIVE_NAME}"

apt-get update && \
    apt-get install -y --no-install-recommends \
    curl ca-certificates git tar xz-utils
    # build-essential pkg-config

# if ! which rustup > /dev/null; then
#     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
#     source $HOME/.cargo/env
# fi

git clone https://github.com/HelloWorldTeraByte/dotfiles.git /opt/dotfiles

mkdir -p $_REMOTE_USER_HOME/.config
ln -s /opt/dotfiles/helix/.config/helix $_REMOTE_USER_HOME/.config/helix

cd /tmp
curl -LO $HELIX_RELEASE_URL

cd /opt
tar -xf /tmp/$HELIX_ARCHIVE_NAME
rm  /tmp/$HELIX_ARCHIVE_NAME
mv $HELIX_DIR_NAME helix
chmod +x helix/hx
ln -s /opt/helix/hx /usr/local/bin

# git clone https://github.com/helix-editor/helix /opt/helix
# cd /opt/helix
# git checkout $HELIX_VERSION
# cargo build --release
# ln -s /opt/helix/target/release/hx /usr/local/bin

ln -Tsf /opt/helix/runtime $_REMOTE_USER_HOME/.config/helix/runtime

chown -R $_REMOTE_USER $_REMOTE_USER_HOME/.cache
