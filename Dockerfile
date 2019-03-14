FROM opensuse/tumbleweed

RUN zypper refresh && zypper  --non-interactive update

RUN zypper --non-interactive install lsb-release \
        cmake curl dcraw wget git openssh gcc gcc-c++ clang swig \
        libcurl-devel boost-devel libboost_regex1_69_0-devel cfitsio-devel \
        libftdi1-devel libdc1394-devel libgphoto2-devel gsl-devel libjpeg-devel libtiff-devel \
        libnova-devel openal-soft-devel libraw-devel libusb-devel \
        fftw-devel zlib-devel libconfuse-devel python3-devel doxygen \
        libdc1394-devel libavdevice-devel libavcodec-devel \
        python-devel vim rtl-sdr-devel limesuite-devel vim

RUN zypper -n install gpsd python-gpsd python-curses gpsd-devel

# Install googletest
WORKDIR /home
RUN git clone https://github.com/google/googletest.git
WORKDIR /home/googletest
RUN cmake .
RUN make install

WORKDIR /home

ADD https://raw.githubusercontent.com/jochym/indi-build/master/run-build.sh /home/
RUN chmod a+x /home/run-build.sh
