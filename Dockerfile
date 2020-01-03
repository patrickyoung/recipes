#--- Stage 1: Build web content ---#

FROM alpine:latest as build
LABEL maintainer="Patrick Young <patrick.young@mac.com>"

# Install gomplate - https://github.com/hairyhenderson/gomplate
RUN apk add --no-cache \
    gomplate

COPY src/ rootfs/ /

WORKDIR /app
RUN ["./build.sh"]

#--- Stage 2: Deploy content to web server ---#

FROM alpine:latest

RUN apk add --no-cache \
    ca-certificates \
    busybox-extras \
    tini

ENTRYPOINT [ "/sbin/tini", "-g", "--" ]

COPY rootfs/ /
COPY --from=build /var/www/html /var/www/html/

CMD [ "httpd", "-f", "-h", "/var/www/html", "-p", "80", "-c", "/etc/httpd.conf" ]

EXPOSE 80

HEALTHCHECK --interval=5s --timeout=1500ms --start-period=10s --retries=3 CMD ["echo", "OK"]