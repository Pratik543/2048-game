FROM alpine:3.20 AS builder

RUN apk add --no-cache curl unzip

RUN curl -fsSL -o /tmp/master.zip \
      https://codeload.github.com/gabrielecirulli/2048/zip/master \
    && unzip /tmp/master.zip -d /tmp \
    && mv /tmp/2048-master /app

FROM nginx:1.27-alpine

COPY --from=builder /app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]