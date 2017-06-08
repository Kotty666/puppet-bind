# == class: bind::config::logging 
#
#  
#
# === Parameters
# filename = file to include
# $configfile = default conf file
class bind::config::logging (
){

  create_resources('bind::config::include',"${::bind::configdir}/logging.conf")

  concat { 'logging.conf':
    owner => $::bind::binduser,
    group => $::bind::bindgroup,
    mode  => '0644',
    path  => $::bind::configdir,
  }

  concat::fragment { 'logging-head.conf':
    target  => 'logging.conf',
    order   => 00,
    content => 'logging {\n',
  }

  concat::fragment { 'logging-foot.conf':
    target  => 'logging.conf',
    order   => 99,
    content => '};\n',
  }

}

