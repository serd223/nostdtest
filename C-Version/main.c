#include<windows.h>
#include <shellapi.h>

int mainCRTStartup(void) { 
    LPWSTR *argv;
    int argc;

    argv = CommandLineToArgvW(GetCommandLineW(), &argc);

    if (argc <= 1) {
        return 0;
    } else {
        int last = 0;
        while (!(argv[1][last] == 0)) {
            last++;
        }
        return last;
    }
}

int main(int argc, char** argv) { return 0; }
