#!/usr/bin/env bash
set -e

if [ "$1" == "" ]; then
	echo "Please provide the URL of the icon as the first argument."
	exit 1
fi

if [ "$2" == "" ]; then
	echo "Please provide the name of the webapp as the second argument."
	exit 1
fi

cd $(mktemp -d)
echo "Downloading $1..."
wget -qO icon "$1"
convert icon icon.png
mkdir -p $HOME/.local/share/icons/webapps
mv icon.png $HOME/.local/share/icons/webapps/$2.png