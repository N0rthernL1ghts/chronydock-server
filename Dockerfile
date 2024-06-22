FROM --platform=${TARGETPLATFORM} lscr.io/linuxserver/baseimage-alpine:3.20

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