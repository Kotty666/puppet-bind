# this define creates the acl part in named.conf
define bind::config::acl (
  $data,
  $aclname = $name,
) {
  include

  validate_string($::bind::config::acl::aclname)
  validate_array($::bind::config::acl::data)

  concat::fragment { $::bind::config::acl::aclname:
    target  => $::bind::configfile,
    order   => 02,
    content => template("${::module_name}/acl.erb"),
  }

}
