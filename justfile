set shell := ["sh", "-c"]
set windows-shell := ["powershell", "-c"]

# _main:
#     @just --list

final:
    zig build-exe chip.zig -target wasm32-wasi -dynamic --export=chipInit -fno-entry --export-table  -O ReleaseSmall 

compile:
    zig build-lib chip.zig -target wasm32-wasi -fno-entry --export-table -O ReleaseSmall -femit-bin

wat:
    wasm2wat chip.wasm


