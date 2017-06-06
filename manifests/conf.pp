# general bind configuration
class bind::conf (
  $directory = $::bind::params::configdir,
  $pid = $::bind::params::pid,
  $auth_nxdomain = $::bind::params::auth_nxdomain,
  $
) inherits ::bind::params {

  $::bind::configfile
}
