FROM --platform=${TARGETPLATFORM} lscr.io/linuxserver/baseimage-alpine:3.21

WORKDIR "/chrony"

RUN apk add --update --upgrade --no-cache chrony tzdata
COPY ["rootfs", "/"]

HEALTHCHECK --interval=20s --timeout=5s CMD chronyc tracking > /dev/null

VOLUME ["/chrony/data"]

EXPOSE 123/UDP

ENV TIMEWATCH_INTERVAL=60
ENV S6_KEEP_ENV=1
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2
ENV S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0

LABEL maintainer="Aleksandar Puharic <aleksandar@puharic.com>" \
      org.opencontainers.image.source="https://github.com/N0rthernL1ghts/chronydock-server" \
      org.opencontainers.image.description="Chronyd - Alpine Build ${TARGETPLATFORM}" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.version="1.0.0"