#!/bin/bash

# Works only if the script id on the root folder
# the main file as the executable.

PROJECT_ROOT_DIR="${0%/*}"
BUILD_DIR="$PROJECT_ROOT_DIR/build"
WORKING_DIR=$(pwd)

if [[ $(pwd) != $PROJECT_ROOT_DIR ]]; then
    cd $PROJECT_ROOT_DIR
    if [ ! -d "$BUILD_DIR" ]; then
        mkdir $BUILD_DIR
        cd $BUILD_DIR
        cmake ../ && make && ./src/main
    else
        cd $BUILD_DIR
        cmake ../ && make && ./src/main      
    fi
fi
