cmake_minimum_required(VERSION 3.14)
project(parent)

include(FetchContent)

FetchContent_Declare(child
  GIT_REPOSITORY https://github.invalid/username/child.git
  GIT_TAG develop   # it's much better to use a specific Git revision or Git tag for reproducibility
)

FetchContent_MakeAvailable(child)

# your program
add_executable(myprog main.cpp)
target_link_libraries(myprog mylib)  # mylib is from "child"