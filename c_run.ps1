$objcopy = "C:\Program Files\LLVM\bin\llvm-objcopy.exe"
$kernel32libpath = "C:\Program Files (x86)\Windows Kits\10\lib\10.0.22000.0\um\x86\kernel32.lib"
$shell32libpath = "C:\Program Files (x86)\Windows Kits\10\lib\10.0.22000.0\um\x86\shell32.lib"

clang -c main.c -m32 -nostdlib -o main.o
& $objcopy --redefine-sym _GetCommandLineA=_GetCommandLineA@0 main.o
clang main.o $kernel32libpath $shell32libpath -o main.exe
if ( $args.count -gt 0 ){
    (Start-Process ./main.exe $args[0] -PassThru -Wait).ExitCode
} else {
    (Start-Process ./main.exe -PassThru -Wait).ExitCode
}
