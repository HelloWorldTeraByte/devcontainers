#!/bin/bash
set -e

apt-get update && \
    apt-get install -y --no-install-recommends \
    curl ca-certificates

curl -LsSf https://astral.sh/uv/install.sh | sh

su - $_REMOTE_USER -c "uv tool install black"
