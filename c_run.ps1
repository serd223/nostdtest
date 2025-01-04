clang -c ./C-Version/main.c -m32 -nostdlib -o main.o
& "C:\Program Files\LLVM\bin\llvm-objcopy.exe" --redefine-sym _GetCommandLineA=_GetCommandLineA@0 main.o
clang main.o "C:\Program Files (x86)\Windows Kits\10\lib\10.0.22000.0\um\x86\kernel32.lib" "C:\Program Files (x86)\Windows Kits\10\lib\10.0.22000.0\um\x86\shell32.lib" -o main.exe
if ( $args.count -gt 0 ){
    (Start-Process ./main.exe $args[0] -PassThru -Wait).ExitCode
} else {
    (Start-Process ./main.exe -PassThru -Wait).ExitCode
}
