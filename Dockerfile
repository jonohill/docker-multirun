FROM curlimages/curl

# renovate: datasource=github-releases depName=nicolas-van/multirun
ARG MULTIRUN_VERSION=1.1.3

ARG TARGETPLATFORM

WORKDIR /tmp

RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
        ARCH=aarch64; \
        LIBC=gnu; \
    elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then \
        ARCH=arm; \
        LIBC=gnueabihf; \
    elif [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
        ARCH=x86_64; \
        LIBC=gnu; \
    else \
        echo "Unsupported architecture: $TARGETPLATFORM"; \
        exit 1; \
    fi && \
    curl -fsSL -o multirun.tar.gz "https://github.com/nicolas-van/multirun/releases/download/${MULTIRUN_VERSION}/multirun-${ARCH}-linux-${LIBC}-${MULTIRUN_VERSION}.tar.gz" && \
    tar xzf multirun.tar.gz

FROM scratch

COPY --from=0 /tmp/multirun /usr/local/bin/multirun
