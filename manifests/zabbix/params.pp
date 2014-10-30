class monitoring::zabbix::java-gateway(
  $java_gateway_config_file   = '/etc/zabbix/zabbix_java_gateway.conf',
  $java_gateway_package       = 'zabbix-java-gateway',
  $java_gateway_listen_ip     = '0.0.0.0',
  $java_gateway_listen_port   = '10052',
  $java_gateway_start_pollers = '5',
){}