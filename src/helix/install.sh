#!/bin/bash
set -e

dpkg -l | grep build-essential || (apt update && apt install build-essential -y -qq)
dpkg -l | grep pkg-config || (apt update && apt install pkg-config -y -qq)
dpkg -l | grep git || (apt update && apt install git -y -qq)

git clone https://github.com/HelloWorldTeraByte/dotfiles.git
ln -s ~/dotfiles/helix/.config/helix ~/.config/helix

git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term --locked

ln -Tsf $PWD/runtime ~/.config/helix/runtime
