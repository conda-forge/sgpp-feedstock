#!/bin/sh

if test `uname` = "Darwin"
then
  COMPILER=clang
else
  COMPILER=gnu
fi

scons COMPILER=${COMPILER} CC=${CC} CXX=${CXX} CPPFLAGS="-I${SP_DIR}/numpy/core/include" BOOST_INCLUDE_PATH=${PREFIX}/include GSL_INCLUDE_PATH=${PREFIX}/include SG_JAVA=0 COMPILE_BOOST_TESTS=0 RUN_PYTHON_TESTS=0 USE_ARMADILLO=0 USE_EIGEN=0 -j${CPU_COUNT} PREFIX=${PREFIX} -Q install || cat config.log
mv ${PREFIX}/lib/sgpp/* ${PREFIX}/lib
cp -rLv lib/pysgpp ${SP_DIR}
