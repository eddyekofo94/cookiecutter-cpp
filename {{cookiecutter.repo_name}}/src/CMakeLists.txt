project(${PROJECT_NAME})

file(GLOB_RECURSE SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/*.h
    ${CMAKE_CURRENT_SOURCE_DIR}/*.hpp
	${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
)

include_directories(includes)

add_executable(${PROJECT_NAME}_src
	${SOURCES}
    )

target_include_directories (${PROJECT_NAME}_src PUBLIC includes)
add_library(${PROJECT_NAME}_lib STATIC ${SOURCES})