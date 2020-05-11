#!/bin/bash

rustup toolchain list | grep -q nightly && time rustup toolchain add nightly

# https://github.com/rust-lang/rust-clippy.git
echo rustup component add clippy
time rustup component add clippy

# https://github.com/rust-lang/rustfmt.git
printf "\n"
echo rustup component add rustfmt
time rustup component add rustfmt

# https://github.com/kennytm/cargo-kcov.git
printf "\n"
echo cargo install cargo-kcov
time cargo install cargo-kcov

# https://github.com/xd009642/tarpaulin.git
printf "\n"
echo cargo install cargo-tarpaulin
time cargo install cargo-tarpaulin

# https://github.com/rust-lang/miri.git
printf "\n"
echo rustup +nightly component add miri
time rustup +nightly component add miri

# https://github.com/racer-rust/racer.git
printf "\n"
echo cargo +nightly install racer
time cargo +nightly install racer
printf "\n"
echo racer complete std::io::B
time racer complete std::io::B
