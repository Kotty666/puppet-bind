# class ::bind::params
# defines the default parameters for installation
class bind::params {
  $manage_package = true
  $chroot = false
  $manage_service = true
  $service_enable = true
  $binduser = 'bind'
  $bindgroup = 'bind'
  $configdir = '/etc/bind'
  $configfile = 'named.conf'
  $global_notify = 'no'
  $pid = '/var/run/named/named.pid'
  $zonefolder = 'zones'

  case $::operatingsystem {
    'Debian':
    {
      $packagename = 'bind9'
    }
    'SLES':
    {
      $packagename = 'bind'
    }
    'RedHat':
    {
      $packagename = 'bind'
    }
    default: { fail( "${::operatingsystem} is not supported by this module")}
  }
}
