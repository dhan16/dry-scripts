#### You can find the default search directory list for your version of CPP by invoking it with the -v option. For example,
cpp -v /dev/null -o /dev/null

#### MacOS library search path
clang -Xlinker -v

#### MacOS include path
clang -x c -v -E /dev/null


#### Misc
    * Set LD_DEBUG=libs on OSX to see the search path. Also see LD_DEBUG=help 
    * -l<libname to link, no lib prefix or file extension; ex: -lnanomsg to link libnanomsg.so>
    * -L <path to search for lib if in non standard directory>
    * -I <path to headers for that library, if in non standard directory>
    * LD_PRELOAD is not available on OSX, instead you can use DYLD_INSERT_LIBRARIES, DYLD_LIBRARY_PATH, and recompile the original executable with -flat_namespace


### References
    * http://nickdesaulniers.github.io/blog/2016/11/20/static-and-dynamic-libraries/
