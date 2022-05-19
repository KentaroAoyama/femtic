FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# https://zenn.dev/hishinuma_t/articles/intel-oneapi_install
# use wget to fetch the Intel repository public key
RUN apt update -y; apt install -y wget gnupg
RUN cd /tmp
RUN wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
# add to your apt sources keyring so that archives signed with this key will be trusted.
RUN apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
# remove the public key
RUN rm GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
# Configure the APT client to use Intel’s repository:
RUN echo "deb https://apt.repos.intel.com/oneapi all main" | tee /etc/apt/sources.list.d/oneAPI.list

RUN apt update -y

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates curl

# install compilers
RUN apt-get update && apt-get install -y \
    sudo \
    cmake \
    g++ \
    intel-basekit \
    intel-hpckit \
    gfortran \
    libomp-dev \
    gcc-multilib \
    openmpi-bin \
    libblacs-mpi-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Do not overcommit
RUN sysctl vm.overcommit_memory=1

# Config and clean up
RUN ldconfig \
    && apt-get clean \
    && apt-get autoremove