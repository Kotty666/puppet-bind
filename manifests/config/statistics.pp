# this define creates the acl part in named.conf
define bind::config::statistics (
  $port,
  $source,
  $ip = $name,
) {

  validate_array($::bind::config::statistics::source)

  $real_source = join($::bind::config::statistics::source,';')

  concat::fragment { $::bind::config::statistics::title:
    target  => $::bind::configfile,
    order   => 03,
    content => template("${module_name}/statistics.erb"),
  }

}
