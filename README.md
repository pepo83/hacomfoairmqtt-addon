Fork from: https://github.com/adorobis/hacomfoairmqtt

Can be installed in HA OS as an Addon!


[![Open your Home Assistant instance.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fpepo83%2Fhacomfoairmqtt-addon)

Important/additional options:

use_socat: true/false  -->if true: uses the Socket/TCP connection (e.g.to the Waveshare RS232 to Wifi adapter)

comfoair_host: "192.168.40.130"  -->IP of Waveshare Adapter

comfoair_port: 8899  -->TCP Port of Waveshare adapter

PcMode: 0 -->0 (default), 1 (PC only), 3 (PC Master, will disable connected CC Ease/comfosense unit), 4 (PC logmodus) 
  
