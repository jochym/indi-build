# Setup OS here
FROM ubuntu/bionic

RUN apt-get -qq update && apt-get -qqy install \
        cdbs dpkg-dev debhelper cmake curl dcraw \
        fakeroot wget git ssh vim && \
        rm -rf /var/lib/apt/lists/*

# Build config
WORKDIR /home

ADD https://raw.githubusercontent.com/jochym/indi-build/master/run-build.sh /home/
RUN chmod a+x /home/run-build.sh
