# create zone files
define ::bind::config::view::zones(
  $type,
  $view_name,
  $zone_name = $::bind::config::zone::title,
  $allow_notify = undef,
  $allow_query = undef,
  $allow_transfer = undef,
  $allow_update = undef,
  $allow_update_forwarding = undef,
  $also_notify = undef, 
  $alt_transfer_source = undef,
  $alt_transfer_source_v6 = undef,
  $check_names = undef,
  $database = undef,
  $delegation_only = undef,
  $dialup = undef,
  $forward = undef,
  $forwarders = undef,
  $in_view = undef,
  $ixfr_from_differences = undef,
  $key_directory = undef,
  $masterfile_format = undef,
  $masters = undef, 
  $max_journal_size = undef,
  $max_refresh_time = undef,
  $max_retry_time = undef,
  $max_transfer_idle_in = undef,
  $max_transfer_idle_out = undef,
  $max_transfer_time_in = undef,
  $max_transfer_time_out = undef,
  $min_refresh_time = undef,
  $min_retry_time = undef,
  $multi_master = undef,
  $notify = undef,
  $notify_source = undef,
  $notify_source_v6 = undef,
  $sig_validity_interval = undef,
  $server_addresses = undef,
  $server_names = undef,
  $transfer_source = undef,
  $transfer_source_v6 = undef,
  $update_policy = undef,
  $use_alt_transfer_source = undef,
  $zone_statistics = undef,
  )
  {
    concat::fragment { "${::view_name}-${::zone_name}":
      target  => "view-${::view_name}",
      order   => 10,
      content => template("${::module_name}/zones.erb"),
  }
  
}