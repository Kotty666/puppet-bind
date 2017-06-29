# generate the record file with header
define bind::record (
  $primary_ns,
  $zone        = $name,
  $ttl         = 86400,
  $mailcontact = "hostmasnter.${::bind::record::name}",
  $serial      = 1,
  $refresh     = '1D',
  $retry       = '30M',
  $expire      = '4W',
  $minimum     = '10M',
  $zonefolder  = 'zones') {
  concat { $::bind::record::zone:
    owner => 'root',
    group => $::bind::bindgroup,
    mode  => '0644',
    path  => "${::bind::configdir}/${::bind::record::zonefolder}/${::bind::record::zone}",
  }

  concat::fragment { "${::bind::record::zone}-header":
    target  => $::bind::record::zone,
    content => template("${::module_name}/zone_file_header.erb"),
    order   => 01,
  }
}

