FROM --platform=${TARGETPLATFORM} nlss/base-alpine

WORKDIR "/chrony"

RUN apk add --update --upgrade --no-cache chrony tzdata
COPY ["rootfs", "/"]

HEALTHCHECK --interval=20s --timeout=5s CMD chronyc tracking > /dev/null

VOLUME ["/chrony/data"]

EXPOSE 123/UDP

ENV TIMEWATCH_INTERVAL=60
