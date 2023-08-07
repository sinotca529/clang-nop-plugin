$(fd -Igtx clang-16 $LLVM_PROJECT/build/bin) \
  -Xclang -load \
  -Xclang ../build/src/libNopPlugin.so \
  -Xclang -add-plugin \
  -Xclang nop-plugin \
  input.c
