
# Class: config
# This class configures users, groups, sudo access and hosts for Savvis servers
#
class config {
  include system
 
  class { 'sudo': 
    purge               => false,
    config_file_replace => false,
  }
 
  sudo::conf { 'admins':
    priority => 10,
    content  => "%hboadmins ALL=(ALL) NOPASSWD: ALL",
  }
}
