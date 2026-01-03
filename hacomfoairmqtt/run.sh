#!usrbinwith-contenv bash
set -e

CONFIG=appconfig.ini

cat  $CONFIG EOF
[comfoair]
type = tcp
host = ${TCP_HOST}
port = ${TCP_PORT}

[mqtt]
server = ${MQTT_HOST}
port = ${MQTT_PORT}
username = ${MQTT_USERNAME}
password = ${MQTT_PASSWORD}
base_topic = ${MQTT_BASE_TOPIC}

[homeassistant]
enable = ${HA_DISCOVERY}
EOF

echo Starting hacomfoairmqtt using TCP (${TCP_HOST}${TCP_PORT})
exec hacomfoairmqtt --config $CONFIG