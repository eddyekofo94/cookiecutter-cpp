# Tests for  =Binary tree
project(${PROJECT_NAME}_test)

# Tests for cpp_binary_search
file(GLOB_RECURSE TEST_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/*.hpp
	${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
)

add_executable(${PROJECT_NAME} ${TEST_SOURCES})
target_link_libraries(
    ${PROJECT_NAME}
    PUBLIC ${CMAKE_PROJECT_NAME}_lib
    gtest gmock_main)

# Register the tests
add_test(NAME ${PROJECT_NAME}
         COMMAND ${PROJECT_NAME})
enable_testing()