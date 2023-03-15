#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cmake_version=3.25.3
cmake_install_script=build-cmake-$cmake_version-linux-x86_x64.sh
echo $SCRIPT_DIR
wget https://github.com/Kitware/CMake/releases/download/v$cmake_version/cmake-$cmake_version-linux-x86_64.sh -O $SCRIPT_DIR/$cmake_install_script
chmod +x $SCRIPT_DIR/$cmake_install_script

cmake_install_dir=$SCRIPT_DIR/cmake-$cmake_version
mkdir -p $cmake_install_dir
/bin/bash /$SCRIPT_DIR/$cmake_install_script --skip-license --prefix=$cmake_install_dir

rm $SCRIPT_DIR/$cmake_install_script

echo "============================================================"
echo ""
echo "  CMake $cmake_version installed into $cmake_install_dir"
echo "  Set $cmake_install_dir/bin to your path"
echo ""
echo "  For bash: "
echo "      export PATH=$cmake_install_dir/bin:\$PATH "
echo "      Or source $SCRIPT_DIR/setup.sh to your environment setup script"
echo ""
echo "  For csh "
echo "      setenv PATH $cmake_install_dir/bin:\$PATH"
echo "      Or source $SCRIPT_DIR/setup.csh to your environment setup script"
echo ""
echo "============================================================"

echo "export PATH=$cmake_install_dir/bin:\$PATH" > $SCRIPT_DIR/setup.sh
echo "setenv PATH $cmake_install_dir/bin:\$PATH" > $SCRIPT_DIR/setup.csh


