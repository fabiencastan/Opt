cmake_minimum_required(VERSION 2.8)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")

set(PROJECT_NAME "Opt")


set(CMAKE_CXX_STANDARD 11)

project(${PROJECT_NAME})

include_directories(API/release/include)
find_library(Opt_LIBRARY libOpt.a ${CMAKE_SOURCE_DIR}/API/release/lib/ )
find_library(Opt_dev_LIBRARY libOptDev.a ${CMAKE_SOURCE_DIR}/API/release/lib/)


set(Opt_LIBRARIES ${Opt_LIBRARY} ${Opt_dev_LIBRARY})

find_package(CUDA QUIET REQUIRED)
set(CUDA_PROPAGATE_HOST_FLAGS OFF)
list( APPEND CUDA_NVCC_FLAGS "-gencode arch=compute_30,code=sm_30; -std=c++11")
find_package(Terra QUIET REQUIRED)

add_subdirectory("API")
add_subdirectory("examples")
