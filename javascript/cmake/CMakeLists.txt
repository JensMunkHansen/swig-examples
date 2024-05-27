cmake_minimum_required(VERSION 3.19)

project(JSChallenge)

find_package(SWIG REQUIRED)
include(UseSWIG)

set(CMAKE_POSITION_INDEPENDENT_CODE ON)

configure_file(binding.gyp ${CMAKE_CURRENT_BINARY_DIR}/binding.gyp)
add_library(challenge SHARED challenge.cxx)
target_include_directories(challenge PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

set_source_files_properties(challenge.i PROPERTIES CPLUSPLUS ON)
set_property(SOURCE challenge.i PROPERTY SWIG_FLAGS "-node")

swig_add_library(swig_challenge LANGUAGE javascript SOURCES challenge.i)
target_include_directories(swig_challenge PUBLIC /usr/include/node)
target_link_libraries(swig_challenge challenge)

# add_custom_command( TARGET swig_challenge POST_BUILD
#   COMMAND node-gyp configure build
#   WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

