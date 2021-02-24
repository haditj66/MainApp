
if(NOT "C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-subbuild/child-populate-prefix/src/child-populate-stamp/child-populate-gitinfo.txt" IS_NEWER_THAN "C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-subbuild/child-populate-prefix/src/child-populate-stamp/child-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: 'C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-subbuild/child-populate-prefix/src/child-populate-stamp/child-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: 'C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe"  clone --no-checkout "https://github.com/haditj66/Lib_A.git" "child-src"
    WORKING_DIRECTORY "C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/haditj66/Lib_A.git'")
endif()

execute_process(
  COMMAND "C:/Program Files/Git/cmd/git.exe"  checkout 0af7c3e0bd62868ca2a3870a022332ae650e9a2a --
  WORKING_DIRECTORY "C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: '0af7c3e0bd62868ca2a3870a022332ae650e9a2a'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe"  submodule update --recursive --init 
    WORKING_DIRECTORY "C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: 'C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-subbuild/child-populate-prefix/src/child-populate-stamp/child-populate-gitinfo.txt"
    "C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-subbuild/child-populate-prefix/src/child-populate-stamp/child-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: 'C:/Users/Hadi/OneDrive/Documents/Cmake_my_tutorials/FetchContentTest/MainApp/build/_deps/child-subbuild/child-populate-prefix/src/child-populate-stamp/child-populate-gitclone-lastrun.txt'")
endif()

