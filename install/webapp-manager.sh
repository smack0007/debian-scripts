#!/usr/bin/env bash
set -e

WEBAPP_MANAGER_URL=http://packages.linuxmint.com/pool/main/w/webapp-manager/webapp-manager_1.4.3_all.deb

cd $(mktemp -d)
wget -O webapp-manager.deb "${WEBAPP_MANAGER_URL}"
sudo apt install ./webapp-manager.deb
rm ./webapp-manager.deb