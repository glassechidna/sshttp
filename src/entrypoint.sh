#!/bin/bash
set -euxo pipefail
mkdir -p ~/.ssh
echo "localhost $SSH_KNOWN_HOST" >> ~/.ssh/known_hosts
exec ssh -o ProxyCommand="websocat -q - ws://${ENDPOINT}" -R ${REMOTE_SSH_FWD_PORT}:${DOCKER_HOST_ADDR}:22 -N -T ${SSH_USER}@localhost
