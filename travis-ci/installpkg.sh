#!/usr/bin/env sh

case "${TRAVIS_OS_NAME}" in
    linux) sudo apt-get -qq -y install libgc-dev libgmp3-dev libgtk-3-dev libev-dev libjansson-dev;;
    osx)   brew install bdw-gc gmp;;
    *)     false;;
esac
