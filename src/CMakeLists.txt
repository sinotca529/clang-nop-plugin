add_library(NopPlugin MODULE NopPlugin.cpp)

set(INCLUDES
    ${LLVM_INCLUDE_DIRS}
    ${CLANG_INCLUDE_DIRS}
)

llvm_map_components_to_libnames(llvm_libs support core irreader)
set(LIBRARIES
    clangAST
    clangBasic
    clangFrontend
    ${llvm_libs}
)

message(STATUS "CLANG_INCLUDE_DIRS : ${CLANG_INCLUDE_DIRS}")

target_include_directories(NopPlugin PRIVATE ${INCLUDES})
target_link_libraries(NopPlugin PRIVATE ${LIBRARIES})

set_target_properties(NopPlugin PROPERTIES
  COMPILE_FLAGS "-fno-rtti"
)
