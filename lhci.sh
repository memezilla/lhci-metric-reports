#!/bin/sh

export LHCI_BUILD_CONTEXT__CURRENT_HASH=$(node -e "new Date().getTime().toString(16).split('').reverse().join('')")
export LHCI_BUILD_CONTEXT__COMMIT_TIME=$(date --iso-8601=seconds)
export LHCI_BUILD_CONTEXT__CURRENT_BRANCH=master
export LHCI_BUILD_CONTEXT__COMMIT_MESSAGE="Periodic run "
export LHCI_BUILD_CONTEXT__AUTHOR="No one <noreply@memezilla.com>"
export LHCI_BUILD_CONTEXT__AVATAR_URL="https://picsum.photos/id/870/200/200"
git commit --allow-empty -m 'Lighthouse CI Periodic run' && git push
lhci autorun --upload.token="$LHCI_UPLOAD__TOKEN" # run lighthouse CI
