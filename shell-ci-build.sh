#!/usr/bin/env bash
set -eo pipefail
source ./shell-ci-build/build.sh
check "./check_bluetooth_battery"
