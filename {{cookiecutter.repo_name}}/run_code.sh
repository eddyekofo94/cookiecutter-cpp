#!/bin/bash

# By Eddy Ekofo [Nice, France, 2020]
# Works only if the script id on the root folder
# Useful commands
# run | -r will run the src target (runs your production code)
# ./run_code.sh -r -s # runs your src binary
# test | -t will run the test target (Simply runs your tests)
# NOTE: This script will always be a working progress!

PROJECT_ROOT_DIR="${0%/*}"
BUILD_DIR="$PROJECT_ROOT_DIR/build"
WORKING_DIR=$(pwd)
ARG_1="$1"
ARG_2="$2"
SRC_BIN="{{cookiecutter.project_name}}_src"
TEST_BIN="{{cookiecutter.project_name}}_test"

build() {
    if [[ $# -eq 0 ]]; then
        echo "Building ALL the targets"
        cmake --build . -- -j4
    else
        if [[ "$ARG_1" == "--build" ]] || [[ "$ARG_1" == "-b" ]]; then
            if [[ -z $ARG_2 ]]; then
                echo "Building ALL the targets"
                cmake --build . -- -j4

            elif [[ "$ARG_2" == "--src" ]] || [[ "$ARG_2" == "-s" ]]; then
                echo "Building \"$SRC_BIN\" executable target"
                cmake --build . --target $SRC_BIN -- -j4
            elif [[ "$ARG_2" == "--test" ]] || [[ "$ARG_2" == "-t" ]]; then
                echo "Building \"$TEST_BIN\" executable target"
                cmake --build . --target $TEST_BIN -- -j4
            else
                echo "Error: CMake target: \"$ARG_2\" is not found"
            fi
        elif [ "$ARG_1" == "--run" ] || [ "$ARG_1" == "-r" ]; then
            echo "Running code"
            if [[ "$ARG_2" == "--src" ]] || [[ "$ARG_2" == "-s" ]]; then
                ./bin/$SRC_BIN
            elif [[ "$ARG_2" == "--test" ]] || [[ "$ARG_2" == "-t" ]]; then
                ./bin/$TEST_BIN
            else
                echo "Error: connot run target \"$ARG_2\""
            fi
        else
            echo "Error: \"$ARG_1\" argument is not found"
        fi
    fi
}

if [[ $(pwd) != $PROJECT_ROOT_DIR ]]; then
    cd $PROJECT_ROOT_DIR
    if [[ ! -d $BUILD_DIR ]]; then
        cmake -S $PROJECT_ROOT_DIR -B $BUILD_DIR
        cmake --build $BUILD_DIR -- -j4
    else
        cd $BUILD_DIR
        build $ARG_1
    fi
fi
