# == Class: iptables_persistent::params
#
# Param loader for iptables_persistent.
#
# === Parameters
#
# Following parameters are available.
#
# [*save_file*]
#   String. Specify where the persistent rules should be stored. Leave as
#   undef if not sure.
# [*content*]
#   String. To be used as content for the file $save_file_real if defined.
# [*source*]
#   String containing a file reference. To be used as source for the file
#   $save_file_real.
#
# === Variables
#
# [*operatingsystem*]
#   Used to get sane defaults for the supported operating systems and to
#   fail if the OS is not supported
#
# TODO: Document local variables.
#
# === Examples
#
#  class { iptables_persistent::params:
#    save_file => '/etc/iptables/rules',
#    source    => 'puppet://modules/iptables_persistent/rules',
#  }
#
#  class { iptables_persistent::params:
#    content  => '
#      *filter
#      :INPUT ACCEPT [27178975:30948110930]
#      :FORWARD ACCEPT [0:0]
#      :OUTPUT ACCEPT [21477225:30731415066]
#      COMMIT
#    ',
#  }
#
# === Authors
#
# Pedro Gonzalez Serrano - http://niteman.es
#
# === Copyright
#
# Copyright 2013 Pedro Gonzalez Serrano.
# Licensed under "The MIT License". See LINCENSE file.
#
class iptables_persistent::params (
  $save_file = undef,
  $content   = undef,
  $source    = undef,
) {

  # TODO: verify that either content or source is provided.

  case $::operatingsystem {
    ubuntu, debian: {
      #$save_file_default = '/etc/iptables/rules'
      $save_file_default = $::lsbdistcodename ? { 
        squeeze => '/etc/iptables/rules',
        default => '/etc/iptables/rules.v4',
      }
      $package_name      = 'iptables-persistent'
      $service_name      = 'iptables-persistent'
    }
#    redhat, centos: {
#    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }

  $save_file_real = $save_file ? {
    undef   => $save_file_default,
    default => $save_file,
  }

}
