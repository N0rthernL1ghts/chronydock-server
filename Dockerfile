FROM --platform=${BUILDPLATFORM} nlss/base-alpine

WORKDIR "/chrony"

RUN apk add --update --upgrade --no-cache chrony
COPY ["rootfs", "/"]

HEALTHCHECK --interval=30s --timeout=5s CMD chronyc tracking > /dev/null

VOLUME ["/chrony/data"]

EXPOSE 123/UDP
