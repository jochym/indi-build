# Setup OS here
FROM jochym/indi-build-core:stretch

# Build config
WORKDIR /home

RUN git clone https://github.com/jochym/indi-base.git indi
RUN indi/CI/build-core.sh
RUN rm -rf /home/indi /home/build
ADD run-libs-build.sh .
RUN chmod a+x run-libs-build.sh