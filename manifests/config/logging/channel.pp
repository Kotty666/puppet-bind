# define logging channels
define bind::config::logging::channel
(
  $target,
  $channel = $::name,
)
{
    concat::fragment { "${::channel}-channel":
    target  => 'logging.conf',
    order   => 05,
    content => template("${::module_name}/channel.erb"),
  }
}