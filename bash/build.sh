#!/bin/bash

set -e
PREFIX="/usr/local/"
#PROJECTS="\
#efl elementary e PROTO/elev8 efx PROTO/shotgun"
#git svn fetch
#git svn rebase
##OPT="--prefix=$PREFIX --enable-build-examples"
#OPT="--prefix=$PREFIX"
#PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"
#PATH="$PREFIX/bin:$PATH"
#LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
#
#start=`date +%s`
#for PROJ in $PROJECTS; do
#  pushd trunk/$PROJ
#  make clean distclean || true
#  autogen.sh $OPT
#  make -j 8
#  sudo make install
#  popd
#  sudo ldconfig
#done
#end=`date +%s`
#build_time=`expr $end - $start`

#echo "Total Build Time = $build_time seconds"

PROJECTS="efl elementary enlightenment"

start=`date +%s`
for PROJ in $PROJECTS; do
  pushd $PROJ
  git fetch
  git rebase
  make clean distclean || true
  autogen.sh $OPT
  make -j 8
  sudo make install
  popd
  sudo ldconfig
done
end=`date +%s`
build_time=`expr $end - $start`

