#!/bin/bash
set -e

apt-get update && \
    apt-get install -y --no-install-recommends \
    curl ca-certificates build-essential pkg-config git 

if ! which rustup > /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
fi

cd $_REMOTE_USER_HOME
git clone https://github.com/HelloWorldTeraByte/dotfiles.git
ln -s $_REMOTE_USER_HOME/dotfiles/helix/.config/helix $_REMOTE_USER_HOME/.config/helix

mkdir programs

git clone https://github.com/helix-editor/helix programs/helix
cd programs/helix
git checkout 25.07.1
cargo build --release

ln -s $_REMOTE_USER_HOME/programs/helix/target/release/hx $_REMOTE_USER_HOME/.local/bin/
ln -Tsf $PWD/runtime $_REMOTE_USER_HOME/.config/helix/runtime

chown -R $_REMOTE_USER $_REMOTE_USER_HOME/.cache
