# Target:   {{ cookiecutter.project_name }}_lib
# Type:     Library
project(${PROJECT_NAME}_test)
file(GLOB_RECURSE SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/*.h
    ${CMAKE_CURRENT_SOURCE_DIR}/*.hpp
	${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
)

add_executable(${PROJECT_NAME} ${TEST_SOURCES})

include_directories(includes)
target_link_libraries(
    ${PROJECT_NAME}
    PUBLIC ${CMAKE_PROJECT_NAME}_lib
    gtest gmock_main)

include(CPack)
add_library(${PROJECT_NAME}_lib SHARED ${SOURCES})
# Register the tests
add_test(NAME ${PROJECT_NAME}
         COMMAND ${PROJECT_NAME})
enable_testing(
# set_target_properties({{ cookiecutter.project_name }}_lib PROPERTIES
#     "OUTPUT_NAME" "{{ cookiecutter.project_name }}"
#     "INCLUDE_DIRECTORIES" "${CMAKE_CURRENT_SOURCE_DIR}/include"
# )
# install(TARGETS {{ cookiecutter.project_name }}_lib EXPORT {{ cookiecutter.project_name }} DESTINATION ${CMAKE_SOURCE_DIR}/lib)
# export(TARGETS {{ cookiecutter.project_name }}_lib FILE ${CMAKE_BINARY_DIR}/{{ cookiecutter.project_name }}-config.cmake)
