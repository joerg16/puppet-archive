# os specific parameters
class archive::params {
  case $::osfamily {
    default: {
      $path      = '/opt/staging'
      $owner     = '0'
      $group     = '0'
      $mode      = '0640'
    }
    'windows': {
      $path      = $::staging_windir
      $owner     = 'S-1-5-32-544' # Adminstrators
      $group     = 'S-1-5-18'     # SYSTEM
      $mode      = '0640'
    }
  }

  if $::is_pe {
    $gem_provider = 'pe_gem'
  } else {
    $gem_provider = 'gem'
  }
}
