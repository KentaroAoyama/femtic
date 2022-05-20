FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

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
  apt-get install -y --no-install-recommends \
    ca-certificates curl && \
  rm -rf /var/lib/apt/lists/*

# install compilers
# TODO: intel/oneapi/setenvの環境変数設定
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

# repository to install Intel(R) GPU drivers
RUN curl -fsSL https://repositories.intel.com/graphics/intel-graphics.key | apt-key add -
RUN echo "deb [trusted=yes arch=amd64] https://repositories.intel.com/graphics/ubuntu bionic main" > /etc/apt/sources.list.d/intel-graphics.list

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential pkg-config libarchive13 openssh-server openssh-client vim wget net-tools git intel-basekit-getting-started intel-oneapi-advisor intel-oneapi-ccl-devel intel-oneapi-common-licensing intel-oneapi-common-vars intel-oneapi-compiler-dpcpp-cpp intel-oneapi-dal-devel intel-oneapi-dev-utilities intel-oneapi-dnnl-devel intel-oneapi-dpcpp-debugger intel-oneapi-ipp-devel intel-oneapi-ippcp-devel intel-oneapi-libdpstd-devel intel-oneapi-mkl-devel intel-oneapi-onevpl-devel intel-oneapi-python intel-oneapi-tbb-devel intel-oneapi-vtune intel-opencl intel-level-zero-gpu level-zero level-zero-devel  && \
  rm -rf /var/lib/apt/lists/*

# Config and clean up
RUN ldconfig \
    && apt-get clean \
    && apt-get autoremove