#!/bin/bash
set -e

apt-get update && \
    apt-get install -y --no-install-recommends \
    curl ca-certificates build-essential pkg-config git 

if ! which rustup > /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
fi

git clone https://github.com/HelloWorldTeraByte/dotfiles.git
ln -s ~/dotfiles/helix/.config/helix ~/.config/helix

git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term --locked

ln -Tsf $PWD/runtime ~/.config/helix/runtime
