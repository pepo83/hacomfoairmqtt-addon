#!/usr/bin/with-contenv bashio
set -e


export MQTT_HOST=$(bashio::services mqtt | jq -r '.host')
export MQTT_PORT=$(bashio::services mqtt | jq -r '.port')
export MQTT_USER=$(bashio::services mqtt | jq -r '.username')
export MQTT_PASS=$(bashio::services mqtt | jq -r '.password')

bashio::log.info "Starting haComfoAir MQTT (TCP only)"
bashio::log.warning "### TCP-ONLY VERSION STARTED ###"

python3 /app/ca350.py