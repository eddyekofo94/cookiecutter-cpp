# Tests for {{ cookiecutter.project_name }}
cmake_minimum_required(VERSION 3.15)
project(${PROJECT_NAME}_test)

# Tests for cpp_binary_search
file(GLOB_RECURSE TEST_SOURCES 
    ${CMAKE_CURRENT_SOURCE_DIR}/*.hpp
	${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
)

add_executable(${PROJECT_NAME}_test ${TEST_SOURCES})
target_link_libraries(${PROJECT_NAME}_test gtest gmock_main)

# Register the tests
add_test(NAME ${PROJECT_NAME}_test
         COMMAND ${PROJECT_NAME}_test)
enable_testing()