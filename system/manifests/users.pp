class system::users (
  $config   = undef,
  $schedule = $::system::schedule,
  $real     = false,
) {
  $defaults = {
    ensure   => 'present',
    schedule => $schedule,
    shell    => '/bin/bash'
  }
  if $real {
    $type = 'user'
  }
  else {
    $type = '@user'
  }
notify { 'inside user.pp':
}
  if $config {
    system_create_resources($type, $config, $defaults)
  }
  else {
notify { 'inside else': }
    $hiera_config = hiera_hash('system::users', undef)
    if $hiera_config {
notify { "inside hiera config ${hiera_config}": }
      system_create_resources($type, $hiera_config, $defaults)
    }
  }
}
