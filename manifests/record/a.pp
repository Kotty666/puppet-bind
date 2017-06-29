# create a record
define bind::record::a ($zone, $ip, $target = $::bind::record::a::name, $ttl = undef) {
  concat::fragment { "${::bind::record::a::zone}-${::bind::record::a::target}":
    target  => $::bind::record::a::zone,
    content => template("${::module_name}/records/a.erb"),
    order   => 10,
  }

}
