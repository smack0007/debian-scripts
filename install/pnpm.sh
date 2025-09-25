#!/usr/bin/env bash
set -e

PNPM_PATH="${HOME}/.pnpm"

PNPM_PLATFORM="$(
	echo "$(uname -s)-$(uname -m)" |
	tr '[:upper:]' '[:lower:]' |
	sed 's/x86_64/x64/'
)"

if [[ "$1" == "" ]]; then
  echo "ERROR: Please provide a version to install."
  exit 1
fi

cd $(mktemp -d)
PNPM_IDENTIFIER="pnpm-v${1}-${PNPM_PLATFORM}"
wget -O pnpm https://github.com/pnpm/pnpm/releases/download/v${1}/pnpm-${PNPM_PLATFORM}

if [ ! -d "${PNPM_PATH}/bin" ]; then
  mkdir -p "${PNPM_PATH}/bin"
fi

if [ -f "${PNPM_PATH}/bin/pnpm" ]; then
  rm "${PNPM_PATH}/bin/pnpm"
fi

mv pnpm ${PNPM_PATH}/bin/pnpm
chmod +x ${PNPM_PATH}/bin/pnpm
