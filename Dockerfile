# yuru7's build environment for composite fonts
# https://github.com/yuru7/HackGen
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install base packages
RUN apt-get update -y && \
    apt-get install -y software-properties-common curl python2 python3 python3-pip && \
    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && \
    python2 get-pip.py && \
    curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py && \
    python3 get-pip.py

# Install ttfautohint
RUN pip3 install ttfautohint-py

# Install fonttools
RUN pip2 install fonttools==3.44.0

# Install dependencies for FontForge
RUN apt-get install -y gcc g++ libjpeg-dev libtiff5-dev libpng-dev libgif-dev libxt-dev libfreetype6-dev autoconf automake libtool libltdl7-dev libxml2-dev libuninameslist-dev libspiro-dev libpango1.0-dev libcairo2-dev chrpath git ninja-build cmake gettext libgtk-3-dev

# Download, build and install FontForge
RUN cd ~ && \
    curl -LO https://github.com/fontforge/fontforge/archive/refs/tags/20201107.tar.gz && \
    tar -zxvf 20201107.tar.gz && \
    cd fontforge-20201107 && \
    mkdir build && \
    cd build && \
    cmake -GNinja .. && \
    ninja && \
    ninja install && \
    rm -rf ~/fontforge-20201107*

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Keep container running
CMD ["bash", "-c", "tail -f /dev/null"]