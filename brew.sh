#!/bin/bash

export ALL_HOMEBREW_NO_AUTO_UPDATE=1

rm -f $(brew --cache)/*.incomplete

echo "==> gcc"
RELEASE=$((lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n 1)
if [[ $(uname)== 'Darwin' ]]; then
    brew install pkg-config
else
    if echo ${RELEASE} | grep CentOS > /dev/null ; then
        brew install gcc
        brew install pkg-config
        brew unlink pkg-config
    else
        brew install gcc
        brew install pkg-config
        brew unlink pkg-config
    fi
fi
