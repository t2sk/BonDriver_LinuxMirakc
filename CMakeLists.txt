cmake_minimum_required(VERSION 3.10)
project(BonDriver_LinuxMirakc VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCES
    src/BonDriver_LinuxMirakc.cpp
    src/char_code_conv.cpp
    src/GrabTsData.cpp
    src/config.cpp
    src/util.cpp
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

# Include directories
target_include_directories(${PROJECT_NAME}
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# Compile options
target_compile_options(${PROJECT_NAME}
    PRIVATE
        -O3 -Wall -pthread -fPIC
)

# Link libraries
target_link_libraries(${PROJECT_NAME}
    PRIVATE
        dl m pthread
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_NAME "BonDriver_LinuxMirakc"
    PREFIX ""
)

install(TARGETS ${PROJECT_NAME}
    LIBRARY DESTINATION lib
)
