#!/bin/bash

# By Eddy Ekofo
# Works only if the script id on the root folder
# Useful commands
# run | -r will run the src target (runs your production code)
# ./cmake_run.sh -r -s # runs your src binary
# test | -t will run the test target (Simply runs your tests)
# NOTE: This script will always be a working progress!

PROJECT_ROOT_DIR="${0%/*}"
BUILD_DIR="$PROJECT_ROOT_DIR/build"
WORKING_DIR=$(pwd)
ARG_1="$1"
ARG_2="$2"
SRC_BIN="{{ cookiecutter.project_name }}_src"
TEST_BIN="{{ cookiecutter.project_name }}_test"

build() {
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
}

run_code() {
    if [[ "$ARG_2" == "--src" ]] || [[ "$ARG_2" == "-s" ]]; then
        ./bin/$SRC_BIN
    elif [[ "$ARG_2" == "--test" ]] || [[ "$ARG_2" == "-t" ]]; then
        ./bin/$TEST_BIN
    else
        echo "Error: connot run target \"$ARG_2\""
    fi
}

clean() {
    if [[ -z $ARG_2 ]]; then
        cmake --clean-first ../CMakeLists.txt -B $BUILD_DIR
    elif [[ "$ARG_2" == "--src" ]] || [[ "$ARG_2" == "-s" ]]; then
        cmake --build . --clean-first --target $SRC_BIN -- -j4
    elif [[ "$ARG_2" == "--test" ]] || [[ "$ARG_2" == "-t" ]]; then
        cmake --build . --clean-first --target $TEST_BIN -- -j4
    fi
}

cmake_run() {
    if [[ $# -eq 0 ]]; then
        echo "Building ALL the targets"
        cmake --build . -- -j4
    else
        if [[ "$ARG_1" == "--build" ]] || [[ "$ARG_1" == "-b" ]]; then
            build $ARG_1
        elif [ "$ARG_1" == "--run" ] || [ "$ARG_1" == "-r" ]; then
            run_code $ARG_1
        elif [[ "$ARG_1" == "--clean" ]] || [[ "$ARG_1" == "-c" ]]; then
            clean $ARG_1
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
        cmake_run $ARG_1
    fi
fi
