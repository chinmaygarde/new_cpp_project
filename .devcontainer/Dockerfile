FROM ubuntu:24.04

# Arguments
ARG LLVM_VERSION=21

# Environment Variables.

ENV DEBIAN_FRONTEND=noninteractive
ENV VCPKG_ROOT=/vcpkg

# Update system dependencies.

RUN apt update && apt install -y \
  build-essential                \
  cmake                          \
  curl                           \
  git                            \
  gnupg                          \
  lsb-release                    \
  ninja-build                    \
  pkg-config                     \
  software-properties-common     \
  tar                            \
  wget                           \
  zip

# Install the latest version of just.

RUN curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin

# Install VCPKG

RUN git clone https://github.com/microsoft/vcpkg.git ${VCPKG_ROOT}
RUN ${VCPKG_ROOT}/bootstrap-vcpkg.sh

# Install Clang/LLVM

WORKDIR /tmp
RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh ${LLVM_VERSION}

# Cleanups

RUN apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/apt/lists/* \
    rm -rf /tmp/*
