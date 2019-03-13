FROM debian:stretch

RUN apt-get -qq update && apt-get -qqy dist-upgrade

RUN apt-get -qqy install \
        cdbs dpkg-dev debhelper cmake curl dcraw fakeroot wget git ssh \
        libcurl4-gnutls-dev libboost-dev libboost-regex-dev libcfitsio-dev \
        libftdi-dev libdc1394-22-dev libgphoto2-dev libgps-dev libgsl-dev libjpeg-dev libtiff5-dev \
        libnova-dev libopenal-dev libraw-dev libusb-1.0-0-dev librtlsdr-dev liblimesuite-dev \
        libfftw3-dev zlib1g-dev libconfuse-dev python3-all-dev doxygen \
        libboost-test-dev python-all-dev swig g++ libftdi1-dev \
        libdc1394-22-dev libavdevice-dev libavcodec-dev \
        googletest clang lsb-release dirmngr vim

# Build and install gtest and gmock libraries
WORKDIR /usr/src/googletest
RUN cmake .
RUN make install

WORKDIR /home

ADD https://raw.githubusercontent.com/jochym/indi-build/master/run-build.sh /home/
RUN chmod a+x /home/run-build.sh
