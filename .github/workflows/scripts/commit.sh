#!/usr/bin/env bash

# Copyright 2023 SECO Mind Srl
# SPDX-License-Identifier: Apache-2.0

set -exEuo pipefail

git config user.name github-actions
git config user.email github-actions@github.com
git add -v rust/edgehog-device-forwarder-proto
git diff --staged --quiet || git commit -s -m "chore(rust): update generated code"
git push
