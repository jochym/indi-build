# Setup OS here
FROM jochym/indi-build-core:stretch

# Build config
WORKDIR /home

ADD run-libs-build.sh .
RUN chmod a+x run-libs-build.sh

RUN git clone https://github.com/jochym/indi-base.git core
RUN bash core/CI/build-core.sh
RUN rm -rf /home/core /home/build
