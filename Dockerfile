FROM alpine
LABEL author "Peng Liu"
LABEL email "myme5261314@gmail.com"


ENV MASSCAN_GIT_URL https://github.com/robertdavidgraham/masscan

RUN set -ex; \
    \
    buildDeps=' \
    ca-certificates \
    clang \
    clang-dev \
    gcc \
    git \
    libc-dev \
    linux-headers \
    make \
    '; \
    \
    runtimeDeps=' \
    libpcap-dev \
    '; \
    apk --update add --no-cache $buildDeps $runtimeDeps; \
    git clone "$MASSCAN_GIT_URL"; \
    cd masscan; \
    make -j; \
    cp bin/masscan /usr/local/bin/; \
    cd ../; \
    rm -rf masscan; \
    \
    apk del --purge $buildDeps

CMD ["/usr/local/bin/masscan"]
