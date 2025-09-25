#!/usr/bin/env bash
set -e

GO_PATH="${HOME}/.go"
GO_URL="https://dl.google.com/go"
GO_PLAT="$(uname -s | tr '[:upper:]' '[:lower:]')"
GO_ARCH="$(
  uname -m |
  tr '[:upper:]' '[:lower:]' |
  sed s/x86_64/amd64/ # replace x86_64 with amd64
)"

if [[ "$1" == "" ]]; then
  echo "ERROR: Please provide a version to install."
  exit 1
fi

cd $(mktemp -d)
wget -O go.tar.gz "${GO_URL}/go${1}.${GO_PLAT}-${GO_ARCH}.tar.gz"
tar -xzf go.tar.gz
rm go.tar.gz

if [ -d "${GO_PATH}" ]; then
  rm -rf ${GO_PATH}
fi

mv ./go "${GO_PATH}"