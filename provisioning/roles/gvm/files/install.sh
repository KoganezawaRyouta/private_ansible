#!/bin/bash

source ~/.bash_profile

if [ $# -ge 1 ]; then
	GO_VERSION=$1
fi

if [ -z `which gvm 2> /dev/null` ]; then
  bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
  source ~/.gvm/scripts/gvm
  gvm install go1.4
  gvm use go1.4
  gvm install $GO_VERSION
  gvm use $GO_VERSION
fi
