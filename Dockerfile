FROM alpine:latest
LABEL maintainer="Patrick Young <patrick.young@mac.com>"

# Install gomplate - https://github.com/hairyhenderson/gomplate
RUN apk add --no-cache \
    ca-certificates \
    curl \
    gomplate

WORKDIR /app

COPY . .

ENTRYPOINT ["./run.sh"]