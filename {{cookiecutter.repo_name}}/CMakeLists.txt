# {{ cookiecutter.project_name }}
# {{ cookiecutter.description }}
# Copyright {{ cookiecutter.year }}, {{ cookiecutter.author }}
cmake_minimum_required(VERSION 3.1...3.17.0)
project({{ cookiecutter.project_name }} C CXX)
set(PROJECT_DESCRIPTION   "{{ cookiecutter.description }}")
set(PROJECT_AUTHOR        "{{ cookiecutter.author }}")
set(PROJECT_URL           "https://github.com/{{ cookiecutter.username }}/{{ cookiecutter.repo_name }}")
set(PROJECT_VERSION_MAJOR "{{ cookiecutter.version.split('.')[0] }}")
set(PROJECT_VERSION_MINOR "{{ cookiecutter.version.split('.')[1] }}")
set(PROJECT_VERSION_PATCH "{{ cookiecutter.version.split('.')[2] }}")

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
set(CMAKE_CXX_STANDARD 17)

# place binaries and libraries according to GNU standards
include(GNUInstallDirs)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR})


# ---------------------------------------------------------
# Features
# ---------------------------------------------------------
include_directories(src)
add_subdirectory(external)
add_subdirectory(test)
add_subdirectory(src)
# add_subdirectory(doc)

include(CTest)
enable_testing()

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})

include(CPack)
