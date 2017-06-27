# define logging channels
define bind::config::logging::channel
(
  $channel = $::name,
  $filename = undef,
  $fileversion = undef,
  $filesize = undef,
  $syslog = undef,
  $severity = undef,
  $print_category = 'no',
  $print_severity ='yes',
  $print_time = 'yes',
)
{
    concat::fragment { "${::channel}-channel":
    target  => 'logging.conf',
    order   => 05,
    content => template("${::module_name}/channel.erb"),
  }
}