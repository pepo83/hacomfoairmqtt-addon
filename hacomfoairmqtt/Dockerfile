ARG BUILD_FROM
FROM $BUILD_FROM

# Python + benötigte Libs
RUN apk add --no-cache \
    python3 \
    py3-paho-mqtt

WORKDIR /app

COPY src/ /app/

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

CMD ["/app/run.sh"]