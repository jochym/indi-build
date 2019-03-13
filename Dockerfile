# Setup OS here


# Build config
WORKDIR /home

ADD https://raw.githubusercontent.com/jochym/indi-build/master/run-build.sh /home/
RUN chmod a+x /home/run-build.sh
