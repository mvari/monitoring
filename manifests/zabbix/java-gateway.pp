class monitoring::zabbix::java-gateway(
  $listen_ip     = $monitoring::zabbix::params::listen_ip,
  $listen_port   = $monitoring::zabbix::params::listen_port,
  $start_pollers = $monitoring::zabbix::params::pollers,
){
  package { "${monitoring::zabbix::params::java_gateway_package}":
    ensure         => installed,
  }
  file {$monitoring::zabbix::params::java_gateway_config_file:
    ensure  => present,
    owner   => 'zabbix',
    group   => 'zabbix',
    mode    => '0640',
    content => template('monitoring/zabbix/zabbix_java_gateway.conf.erb'),
  }
}