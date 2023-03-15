#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Installing CMAKE"

bash  $SCRIPT_DIR/deps/install_cmake.sh

