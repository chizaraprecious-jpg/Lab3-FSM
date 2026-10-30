#!/bin/bash

if [ "$(uname -s)" == "Darwin" ]; then
    g++ -std=c++17 -o main main.cpp \
        -isystem "$(brew --prefix googletest)"/include \
        -L"$(brew --prefix googletest)/lib" \
        -lgtest -lgtest_main -pthread
else
    g++ -o main task0/main.cpp -lgtest -lgtest_main -pthread 
    # -lgtest links main with the gtest lib
    # -pthread gives it access to POSIX threading support
fi
./main