class monitoring::zabbix::server-all(
  $zabbix_server,
  $listen_port          ='80',
  $db_user              = 'zabbix',
  $db_password,
  $db_type              = 'mysql',
  $java_gateway         = '0.0.0.0',
  $java_gateway_port    = '10052'
  $java_gateway_pollers = '5'
  ) {
  #declaring additional run stage
  stage { 'stage01': }
  Stage['stage01'] -> Stage['main']

  class { "mysql":
    stage  => 'stage01'
  } ->
  mysql::grant { 'zabbix':
    mysql_user => $db_user,
    mysql_password => $db_password,
  }
  class {'zabbix::agent':
    zabbix_server => $zabbix_server,
    stage => 'stage01'
  }
  class { "apache":
    port => $listen_port
  } ->
  class { 'zabbix::server':
    db_password => $db_password
  } ->
  class { 'zabbix::web':
    server_name  => $zabbix_server,
    db_type        => $db_type
  } ->
  class {'monitoring::zabbix:java-gateway':
    listen_ip       => $java_gateway,
    listen_port     => $java_gateway_port,
    start_pollers   => $java_gateway_pollers
  }
}