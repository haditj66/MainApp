# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.19.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(child-populate NONE)

include(ExternalProject)
ExternalProject_Add(child-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://github.com/haditj66/Lib_A.git" "GIT_TAG" "0af7c3e0bd62868ca2a3870a022332ae650e9a2a"
                    SOURCE_DIR          "C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-src"
                    BINARY_DIR          "C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)


