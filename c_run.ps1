
clang main.c -nostdlib -lkernel32 -lshell32 -o main.exe

# The following can be used instead to build a 32 bit executable.
#
# $objcopy = "C:\Program Files\LLVM\bin\llvm-objcopy.exe"
# $kernel32libpath = "C:\Program Files (x86)\Windows Kits\10\lib\10.0.22000.0\um\x86\kernel32.lib"
# $shell32libpath = "C:\Program Files (x86)\Windows Kits\10\lib\10.0.22000.0\um\x86\shell32.lib"
#
# clang -c main.c -m32 -nostdlib -o main.o
# & $objcopy --redefine-sym _GetCommandLineA=_GetCommandLineA@0 main.o
# clang main.o $kernel32libpath $shell32libpath -o main.exe
#
#
# The only noticable difference between the 64 bit and the 32 bit executable is the dll's they depend on. Here are the `ldd` outputs for both versions:
# 32 bit version:
# $ ldd main.exe
#         ntdll.dll => /c/Windows/SYSTEM32/ntdll.dll (0x7ffec6770000)
#         ntdll.dll => /c/Windows/SysWOW64/ntdll.dll (0x76e70000)
#         wow64.dll => /c/Windows/System32/wow64.dll (0x7ffec58d0000)
#         wow64win.dll => /c/Windows/System32/wow64win.dll (0x7ffec5460000)
#
# 64 bit version
# $ ldd main.exe
#         ntdll.dll => /c/Windows/SYSTEM32/ntdll.dll (0x7ffec6770000)
#         KERNEL32.DLL => /c/Windows/System32/KERNEL32.DLL (0x7ffec51c0000)
#         KERNELBASE.dll => /c/Windows/System32/KERNELBASE.dll (0x7ffec43e0000)
#         SHELL32.dll => /c/Windows/System32/SHELL32.dll (0x7ffec5940000)
#         msvcp_win.dll => /c/Windows/System32/msvcp_win.dll (0x7ffec3ff0000)
#         ucrtbase.dll => /c/Windows/System32/ucrtbase.dll (0x7ffec4150000)
#         USER32.dll => /c/Windows/System32/USER32.dll (0x7ffec54f0000)
#         win32u.dll => /c/Windows/System32/win32u.dll (0x7ffec4250000)
#         GDI32.dll => /c/Windows/System32/GDI32.dll (0x7ffec48c0000)
#         gdi32full.dll => /c/Windows/System32/gdi32full.dll (0x7ffec3e80000)

if ( $args.count -gt 0 ){
    (Start-Process ./main.exe $args[0] -PassThru -Wait).ExitCode
} else {
    (Start-Process ./main.exe -PassThru -Wait).ExitCode
}
