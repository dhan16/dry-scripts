
set(CMAKE_CXX_STANDARD 11)

link_directories(/usr/local/lib)

include_directories(boost/include)

set(STD_SOURCE_FILES
        std/thread.cpp
        std/initializer_list.cpp)

add_executable(runexample runexample.cpp ${BOOST_SOURCE_FILES} ${STD_SOURCE_FILES})
target_link_libraries(runexample boost_regex boost_system boost_thread-mt)

* ninja
cmake .. -G Ninja -DCMAKE_MAKE_PROGRAM=/path/to/ninja
