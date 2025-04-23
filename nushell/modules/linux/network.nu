def killport [] : int -> nothing {
  let port = $in
  let pid = (lsof -t -i :$port | get stdout | str trim)
  if $pid != "" {
    sudo kill -9 $pid
  } else {
    print "No process found on port ($port)"
  }
}
