#!/usr/bin/env bash
set -e

BETTERFOX_URL="https://github.com/yokoffing/Betterfox/raw/refs/heads/main/user.js"
FIREFOX_PROFILES="$(cat ./profiles.ini | grep "Default=" | cut -c 9-)"
FIREFOX_PATH="${HOME}/.mozilla/firefox"

cd $(mktemp -d)
wget -O user.js "${BETTERFOX_URL}"

for profile in ${FIREFOX_PROFILES}; do
	if [ -d "${FIREFOX_PATH}/$profile" ]; then
		if [ -f "${FIREFOX_PATH}/$profile/user.js" ]; then
			rm -v "${FIREFOX_PATH}/$profile/user.js"
		fi
		cp -v user.js "${FIREFOX_PATH}/$profile/user.js"
	fi
done