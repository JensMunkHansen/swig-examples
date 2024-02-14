#include <stdio.h>

#ifdef _WIN32
#   define API __declspec(dllexport)
#else
#   define API
#endif

typedef void (*CALLBACK)(char**);

CALLBACK g_cb;

// Expose API to register the callback
API void set_callback(CALLBACK cb) {
    g_cb = cb;
}

// Expose API to call the Python callback with a char**
API void call_python_function(char** pp) {
    if(g_cb) {
        g_cb(pp);
        printf("%s\n", *pp);
    }
}

