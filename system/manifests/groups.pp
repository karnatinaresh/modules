class system::groups (
  $config   = undef,
  $schedule = $::system::schedule,
  $real     = true,
) {
  $defaults = {
    ensure   => 'present',
    schedule => $schedule,
  }
  if $real {
    $type = 'group'
  }
  else {
    $type = '@group'
  }
  notify { 'inside group.pp':
}
  if $config {
    system_create_resources($type, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('system::groups', undef)
    if $hiera_config {
      system_create_resources($type, $hiera_config, $defaults)
    }
  }
}
