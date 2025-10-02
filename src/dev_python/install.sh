#!/bin/bash
set -e

apt-get update && \
    apt-get install -y --no-install-recommends \
    curl ca-certificates

curl -LsSf https://astral.sh/uv/install.sh | sh

chown -R $_REMOTE_USER $_REMOTE_USER_HOME/.cache

su - $_REMOTE_USER -c "uv tool install python-lsp-server black"
