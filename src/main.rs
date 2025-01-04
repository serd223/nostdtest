#![feature(start)]
#![no_std]
#![no_main]

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}

// The argv strings seem to be null-terminated only when using release mode
#[no_mangle]
#[start]
fn main(argc: i32, argv: *const *const u8) -> i32 {
    if argc > 1 {
        let mut arg = unsafe { *argv.add(1) };
        let mut len = 0;
        while unsafe { *arg } != 0 {
            len += 1;
            arg = unsafe { arg.add(1) };
        }
        return len;
    } else {
        return 0;
    }
}
