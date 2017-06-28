# Class: bind
# ===========================
#
# Full description of class bind here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'bind':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class bind (
  $manage_package = $::bind::params::manage_package,
  $packagename = $::bind::params::packagename,
  $chroot = $::bind::params::chroot,
  $manage_service = $::bind::params::manage_service,
  $service_enable = $::bind::params::service_enable,
  $binduser = $::bind::params::binduser,
  $bindgroup = $::bind::params::bindgroup,
  $configdir = $::bind::params::configdir,
  $configfile = $::bind::params::configfile,
  $zonefolder = $::bind::params::zonefolder
) inherits ::bind::params {

  if $manage_package == true {
    package { 'bind_pkg':
      ensure => 'installed',
      name   => $packagename,
    }
  }

  if $::bind::mange_service == true {
    service { 'bind':
      ensure => $::bind::service_enable,
      name   => $::bind::packagename,
      enable => $::bind::service_enable,
    }
  }

  concat { $::bind::configfile:
    owner => 'root',
    group => $::bind::bindgroup,
    mode  => '0644',
    path  => $::bind::configdir,
  }

  concat::fragment { 'File Header':
    target  => $::bind::configfile,
    content => "# This file is managed by Puppet. DO NOT EDIT.\n",
    order   => 01,
  }

}
