# == define: bind::config::include 
#
# adds include lines to the general config. 
#
# === Parameters
# filename = file to include
# $configfile = default conf file
define bind::config::include (
  $filename = $name,
  $configfile = $bind::params::configfile,
) {

  concat::fragment { $::bind::config::include::name:
    target  => $::bind::configfile,
    order   => 99,
    content => template("${module_name}/include.erb"),
  }
}
