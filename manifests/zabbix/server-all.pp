class monitoring::zabbix::server-all(
  $zabbix_server,
  $listen_port ='80',
  $db_password,
  $db_type = 'mysql',
) {
  class { "mysql": } ->
  mysql::grant { '${zabbix::server::db_name}':
    mysql_username => $zabbix::server::db_user,
    mysql_password => $db_password,
  } ->
  class { "apache":
    port => $listen_port
  } ->
#  class { 'zabbix::server':
#    db_password => $db_password
#  } ->
#  class { 'zabbix::proxy':
#    server_name => $zabbix_server,
#    db_type     => $db_type
#  } ->
#  class {'zabbix::agent':
#    zabbix_server => $zabbix_server
#  }
}
