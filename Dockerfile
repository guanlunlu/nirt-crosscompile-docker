FROM ubuntu:22.04

RUN apt update && apt install -y \
    vim \
    git \
    net-tools \
    ranger \
    tmux \
    cmake

RUN apt install -y ninja-build
RUN apt-get install -y xz-utils

RUN ln -s /usr/bin/python3 /usr/bin/python

COPY ./ni_crosscompile_toolchain/oecore-x86_64-core2-64-toolchain-5.0.sh /tmp/oecore-x86_64-core2-64-toolchain-5.0.sh

RUN cd /tmp && chmod +x * && ./oecore-x86_64-core2-64-toolchain-5.0.sh -y

RUN echo ". /usr/local/oecore-x86_64/environment-setup-core2-64-nilrt-linux" >> ~/.bashrc

RUN echo "PS1=\"${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ \"" >> ~/.bashrc

CMD ["/bin/bash"]
