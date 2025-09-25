#!/usr/bin/env bash
set -e

NODE_PATH="${HOME}/.node"
  
NODE_PLATFORM="$(
	echo "$(uname -s)-$(uname -m)" |
	tr '[:upper:]' '[:lower:]' |
	sed 's/x86_64/x64/'
)"

if [[ "$1" == "" ]]; then
  echo "ERROR: Please provide a version to install."
  exit 1
fi

cd $(mktemp -d)
NODE_IDENTIFIER="node-v${1}-${NODE_PLATFORM}"
wget -O node.tar.gz https://nodejs.org/dist/v${1}/${NODE_IDENTIFIER}.tar.gz
tar -xzf node.tar.gz
rm node.tar.gz

if [ -d "${NODE_PATH}" ]; then
  rm -rf ${NODE_PATH}
fi

mv ${NODE_IDENTIFIER} ${NODE_PATH}
