class elasticsearch::web::bigdesk::download(
  $web_root,
  $app_root
){
  exec{'get_bigdesk':
    cwd       => $web_root,
    user      => root,
    path      => ['/usr/bin'],
    command   => "git clone -b master git://github.com/lukas-vlcek/bigdesk.git ${app_root}",
    creates   => $app_root,
    require   => Service['elasticsearch'],
    notify    => Service['apache'],
  }
}