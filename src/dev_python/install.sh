#!/usr/bin/env bash
set -e

apt-get update && \
    apt-get install -y --no-install-recommends \
    curl ca-certificates

if ! which uv &> /dev/null; then
    echo "uv not found. Installing uv to /usr/local/bin..."
    curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR="/usr/local/bin" sh
else
    echo "uv is already installed. Skipping installation."
fi

chown -R $_REMOTE_USER $_REMOTE_USER_HOME/.cache

UV_TOOL_BIN_DIR=/usr/local/bin for pkg in python-lsp-server black; do uv tool install $pkg; done
