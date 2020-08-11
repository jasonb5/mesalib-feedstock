#!/bin/bash

meson builddir/ \
  -Dbuildtype=release \
  -Dprefix=$PREFIX \
  -Dlibdir=lib \
  -Dplatforms=x11 \
  -Dosmesa=gallium \
  -Dosmesa-bits=8 \
  -Dglx=xlib \
  -Dllvm=true \
  -Dshared-llvm=false \
  -Dbuild-tests=true

ninja -C builddir/ -j ${CPU_COUNT}

ninja -C builddir/ install

# TODO move to tests section of meta.yaml
meson test -C builddir/
