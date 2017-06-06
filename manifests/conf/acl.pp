# this define creates the acl part in named.conf
define bind::conf::acl (
  $data,
  $aclname = $name,
) {
  include

  validate_string($::bind::conf::acl::aclname)
  validate_array($::bind::conf::acl::data)

  concat::fragment { $::bind::conf::acl::aclname:
    target  => $::bind::configfile,
    order   => 02,
    content => template("${module_name}/acl.erb"),
  }

}
