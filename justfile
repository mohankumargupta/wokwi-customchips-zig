set shell := ["sh", "-c"]
set windows-shell := ["powershell", "-c"]

# _main:
#     @just --list

compile:
    zig build-lib chip.zig -target wasm32-freestanding 



