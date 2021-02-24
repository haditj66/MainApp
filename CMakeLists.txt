cmake_minimum_required(VERSION 3.14)
project(parent)

include(FetchContent)
 
FetchContent_Declare(child
  GIT_REPOSITORY https://github.com/haditj66/Lib_A.git
  GIT_TAG 0af7c3e0bd62868ca2a3870a022332ae650e9a2a   # it's much better to use a specific Git revision or Git tag for reproducibility
)

FetchContent_MakeAvailable(child)

# your program
add_executable(myprog main.cpp)
#target_link_libraries(myprog STATIC LibA)  # mylib is from "child"