#!/bin/bash

if [ ! -f /etc/os-release ]; then
  . /etc/os-release
  if [ "$ID" = "ubuntu" ]; then
    # Check ubuntu's version
    if [ $(echo "$VERSION_ID >= 24.04" | bc) != 1 ]; then
      echo "$(tput setaf 1)Error: Ubuntu 24.04 or higher required. Current: $VERSION_ID"
      exit 1
    fi
    # Check architecture (x86_64 for ubuntu)
    if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "i686" ]; then
      echo "$(tput setaf 1)Error: Only x86 architectures supported on Ubuntu. Current: $ARCH"
      exit 1
    fi
    export OS_TYPE="ubuntu"
  else
    echo "$(tput setaf 1)Error: Unsupported Linux distribution: $ID"
    exit 1
  fi
elif [ "$(uname -s)" = "Darwin" ]; then
  MACOS_VERSION=$(sw_vers -productVersion)
  if [ $(echo "$MACOS_VERSION < 12.0" | bc) = 1 ]; then
    echo "$(tput setaf 1)Error: macOS 12.0 or higher required. Current: $MACOS_VERSION"
    exit 1
  fi
  export OS_TYPE="macos"
else
  echo "$(tput setaf 1)Error: Unsupported OS. Neither Ubuntu nor macOS detected."
  exit 1
fi
