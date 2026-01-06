#!/usr/bin/with-contenv bashio
set -e

#export timezone
if [ -e /etc/localtime ]; then
    export TZ=$(readlink /etc/localtime | sed 's|.*/zoneinfo/||')
    bashio::log.info "Timezone set to ${TZ}"
fi

# MQTT vom Supervisor
export MQTT_HOST=$(bashio::services mqtt | jq -r '.host')
export MQTT_PORT=$(bashio::services mqtt | jq -r '.port')
export MQTT_USER=$(bashio::services mqtt | jq -r '.username')
export MQTT_PASS=$(bashio::services mqtt | jq -r '.password')

USE_SOCAT=$(bashio::config 'use_socat')
SERIAL_DEVICE=$(bashio::config 'Serial_port')
export SERIAL_DEVICE

if [ "$USE_SOCAT" = "true" ]; then
    COMFOAIR_HOST=$(bashio::config 'comfoair_host')
    COMFOAIR_PORT=$(bashio::config 'comfoair_port')

    bashio::log.warning "SOCAT enabled → ${COMFOAIR_HOST}:${COMFOAIR_PORT} → ${SERIAL_DEVICE}"

    /usr/bin/socat \
      PTY,link=${SERIAL_DEVICE},raw,echo=0 \
      TCP:${COMFOAIR_HOST}:${COMFOAIR_PORT} &

    sleep 1
else
    bashio::log.warning "SOCAT disabled → using serial device ${SERIAL_DEVICE}"
fi

bashio::log.info "Starting haComfoAir MQTT"
python3 /app/ca350.py