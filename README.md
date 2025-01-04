# nostdtest
Test project where I try to compile a Rust and a C program while linking to as few libraries as possible.

# The test program
Both the Rust and the C programs do the same thing, they optionally accept a single command line arguement and if the arguement is provided, they return the length of the arguement as their exit code, otherwise they return 0 as their exit code.

# Build instructions
## Rust
```console
  $ cargo run --release -- hello!   
      Finished `release` profile [optimized] target(s) in 0.00s
       Running `target\release\nostdtest.exe hello!`
  error: process didn't exit successfully: `target\release\nostdtest.exe hello!` (exit code: 6)
```

## C
Currently, the C version only supports Windows. 
### Prerequisites
  - `clang`
  - Windows SDK
### Instructions
```console
  $ ./c_run.ps1 hello!
  6
```
