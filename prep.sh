#!/bin/bash

make_bundle() {
    mkdir -p deps
    ecl --shell util/bundle.lisp
}

make_bundle
