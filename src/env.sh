#!/bin/bash
apt-get update \
&& apt-get install -y sudo \
&& apt-get install -y  --no-install-recommends g++ \
intel-basekit \
intel-hpckit \
gfortran \
libomp-dev \
gcc-multilib \
openmpi-bin \
libblacs-mpi-dev