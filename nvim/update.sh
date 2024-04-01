#!/usr/bin/env bash

set -e

DIR="${BASH_SOURCE%/*}"

cp -rf  ~/.config/nvim/lua/user/ "$DIR/"

