cmake_minimum_required(VERSION 3.6)
project(ntl)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

find_library(GMP_LIBRARY NAMES gmp)
find_path(GMP_INCLUDE_DIR NAMES gmp.h)

find_library(GF2X_LIBRARY NAMES gf2x)
find_path(GF2X_INCLUDE_DIR NAMES gf2x.h)

file(GLOB SOURCES src/*.cpp)

add_library(${PROJECT_NAME} SHARED ${SOURCES})
target_include_directories(ntl include ${GMP_INCLUDE_DIR} ${GF2X_INCLUDE_DIR})
target_link_libraries(ntl ${GMP_LIBRARY} ${GF2X_LIBRARY})

install(TARGETS ${PROJECT_NAME}
                RUNTIME DESTINATION bin
                ARCHIVE DESTINATION lib
                LIBRARY DESTINATION lib)
file(GLOB HEADERS include/NTL/*.h)
install(FILES ${HEADERS} DESTINATION include/NTL)
