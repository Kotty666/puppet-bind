# general bind configuration
class bind::config (
  $directory = $bind::params::configdir,
  $pid = $bind::params::pid,
  $auth_nxdomain = $bind::params::auth_nxdomain,
  $configdir = $bind::params::configdir,
  $configfile = $bind::params::configfile,
  $allow_query = undef,
  $allow_query_cache = undef,
  $allow_recursion = undef,
  $allow_transfer = undef,
  $also_notify = undef,
  $auth_nxdomain = undef,
  $bindkeys_file = undef,
  $directory = undef,
  $dnssec_enable = undef,
  $dnssec_lookaside = undef,
  $dnssec_validation = undef,
  $dump_file = undef,
  $forwarders = undef,
  $listen_on_port = undef,
  $listen_on_v6_port = undef,
  $max_ncache_ttl = undef,
  $memstatistics_file = undef,
  $notify = undef,
  $notify_source = undef,
  $notify_source_v6 = undef,
  $query_source = undef,
  $query_source_v6 = undef,
  $rate_limit = undef,
  $recursion = undef,
  $recursive_clients = undef,
  $statistics_file = undef,
  $tcp_clients = undef,
  $transfer_format = undef,
  $transfer_source = undef,
  $transfer_source_v6 = undef,
  $transfers_in = undef,
  $transfers_out = undef,
  $transfers_per_ns = undef,
  $version = undef,
  ) inherits ::bind::params {

  concat::fragment { 'config_general'
    target  => $::configfile,
    order   => 02,
    content => template("${::module_name}/general.erb"),
  }


}

