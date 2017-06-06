# this define creates the acl part in named.conf
define bind::conf::statistics (
  $port,
  $source,
  $ip = $name,
) {

  validate_array($::bind::conf::statistics::source)

  $real_source = join($::bind::conf::statistics::source,';')

  concat::fragment { $bind::conf::statistics::name:
    target  => $::bind::configfile,
    order   => 03,
    content => template("${module_name}/statistics.erb"),
  }

}
