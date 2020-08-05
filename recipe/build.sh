#!/bin/bash

meson builddir/ \
  -Dbuildtype=release \
  -Dprefix=$PREFIX \
  -Dlibdir=lib \
  -Dplatforms=x11 \
  -Dosmesa=gallium \
  -Dosmesa-bits=8 \
  -Dgallium-drivers=swrast \
  -Ddri-drivers=[] \
  -Dvulkan-drivers=[] \
  -Dglx=xlib \
  -Dgbm=false \
  -Degl=false \
  -Dllvm=true \
  -Dshared-llvm=false

ninja -C builddir/ -j ${CPU_COUNT}

ninja -C builddir/ install
