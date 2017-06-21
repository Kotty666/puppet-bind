# define logging categorys
define bind::config::logging::category
(
  $target,
  $category = $::name,
)
{
    concat::fragment { "${::category}-category":
    target  => 'logging.conf',
    order   => 10,
    content => template("${::module_name}/category.erb"),
  }
}