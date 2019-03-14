# Setup OS here
FROM jochym/indi-build-core:stretch

# Build config
WORKDIR /home

RUN git clone https://github.com/jochym/indi-base.git indi
RUN cd /home/indi/ && CI/circle/build-core.sh
RUN rm -rf /home/indi