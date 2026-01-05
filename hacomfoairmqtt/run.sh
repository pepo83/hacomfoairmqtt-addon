#!/usr/bin/with-contenv bashio
set -e


export MQTT_HOST=$(bashio::services mqtt | jq -r '.host')
export MQTT_PORT=$(bashio::services mqtt | jq -r '.port')
export MQTT_USER=$(bashio::services mqtt | jq -r '.username')
export MQTT_PASS=$(bashio::services mqtt | jq -r '.password')

# ComfoAir TCP target from options
COMFOAIR_HOST=$(bashio::config 'comfoair_host')
COMFOAIR_PORT=$(bashio::config 'comfoair_port')

bashio::log.info "Starting socat TCP → PTY (/tmp/comfoair)"
/usr/bin/socat \
  PTY,link=/tmp/comfoair,raw,echo=0 \
  TCP:${COMFOAIR_HOST}:${COMFOAIR_PORT} &

# give socat time to create PTY
sleep 1

bashio::log.info "Starting haComfoAir MQTT (TCP only)"
bashio::log.warning "### TCP-ONLY VERSION STARTED ###"

python3 /app/ca350.py