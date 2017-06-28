# create view files
define bind::config::view(
  $view_name = $::title,
  $match_clients = undef,
  $match_destinations = undef,
  $match_recursive_only = undef,
  )
  {
  concat { "view-${::view_name}":
	  owner => $::bind::binduser,
	  group => $::bind::bindgroup,
	  mode  => '0644',
	  path  => $::bind::configdir,
  }
  
  concat::fragment { 'View Header':
    target => "view-${::view_name}",
    order => 00,
    content => '# This file ist managed by Puppet',
  }
  concat::fragment { 'View Footer':
    target => "view-${::view_name}",
    order => 00,
    content => '} ;',
  }
  
}