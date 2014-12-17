#!/usr/bin/env sh

case "${TRAVIS_OS_NAME}" in
    linux) sudo apt-get -qq -y install libgc-dev libgmp3-dev;;
    osx)   sudo brew install bdw-gc gmp;;
    *)     false;;
esac
