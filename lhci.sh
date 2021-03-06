#!/bin/bash

# https://explainshell.com/explain?cmd=set+-euxo%20pipefail
set -euxo pipefail
export LHCI_BUILD_CONTEXT__CURRENT_HASH=$(head -n 4096 /dev/urandom | openssl sha1 | sed 's/(stdin)=//g' | fold -w 8 | head -n 1)
export LHCI_BUILD_CONTEXT__COMMIT_TIME=$(date +%Y-%m-%dT%H:%M:%S%z)
export LHCI_BUILD_CONTEXT__CURRENT_BRANCH=master
export LHCI_BUILD_CONTEXT__COMMIT_MESSAGE="Periodic run"
export LHCI_BUILD_CONTEXT__AUTHOR="No one <noreply@memezilla.com>"
export LHCI_BUILD_CONTEXT__AVATAR_URL="https://picsum.photos/id/870/200/200"
npm install -g @lhci/cli@0.3.x
npm install -g lighthouse
npm install -g lighthouse-plugin-field-performance
lhci autorun
