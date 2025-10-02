#!/bin/bash
set -e

apt-get update && \
    apt-get install -y --no-install-recommends \
    curl ca-certificates

curl -LsSf https://astral.sh/uv/install.sh | sh

chown -R $_REMOTE_USER $_REMOTE_USER_HOME/.cache

export UV_TOOL_BIN_DIR="/usr/local/bin"
uv tool install python-lsp-server
uv tool install black
