# Target:   {{ cookiecutter.project_name }}_lib
# Type:     Library
file(GLOB_RECURSE SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/*.h
    ${CMAKE_CURRENT_SOURCE_DIR}/*.hpp
	${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
))

add_executable(
	{{ cookiecutter.project_name }}
	${SOURCES}
    )

include_directories(includes)
target_include_directories (Main PUBLIC includes)

include(CPack)
# add_library({{ cookiecutter.project_name }}_lib SHARED ${SOURCES})
# set_target_properties({{ cookiecutter.project_name }}_lib PROPERTIES
#     "OUTPUT_NAME" "{{ cookiecutter.project_name }}"
#     "INCLUDE_DIRECTORIES" "${CMAKE_CURRENT_SOURCE_DIR}/include"
# )
# install(TARGETS {{ cookiecutter.project_name }}_lib EXPORT {{ cookiecutter.project_name }} DESTINATION ${CMAKE_SOURCE_DIR}/lib)
# export(TARGETS {{ cookiecutter.project_name }}_lib FILE ${CMAKE_BINARY_DIR}/{{ cookiecutter.project_name }}-config.cmake)
