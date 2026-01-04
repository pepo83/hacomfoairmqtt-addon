#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Starting haComfoAir MQTT (TCP only)"

python3 /app/ca350.py