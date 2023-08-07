# require : llvm-16
LLVM_BUILD_DIR=$LLVM_PROJECT/build

cmake \
    -G Ninja \
    -B build \
    -D CMAKE_BUILD_TYPE=Rerease \
    -D CMAKE_PREFIX_PATH=$LLVM_BUILD_DIR/lib/cmake \
    -D CMAKE_C_COMPILER=$LLVM_BUILD_DIR/bin/clang \
    -D CMAKE_CXX_COMPILER=$LLVM_BUILD_DIR/bin/clang++ \
    -D CUSTOM_LINKER=mold

unset LLVM_BUILD_DIR
