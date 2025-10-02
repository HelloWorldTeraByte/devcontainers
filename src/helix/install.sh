#!/bin/bash
set -e

git clone https://github.com/HelloWorldTeraByte/dotfiles.git
ln -s ~/dotfiles/helix/.config/helix ~/.config/helix

git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term --locked

ln -Tsf $PWD/runtime ~/.config/helix/runtime
