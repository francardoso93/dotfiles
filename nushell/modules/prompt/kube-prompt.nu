export def kube_prompt [] {
  let cmd = (history | last 1 | get command.0 | default "")
  if ($cmd | str starts-with 'k') {
    let k_prompt =  ([(kubectl ctx -c), (kubectl ns -c)] | str trim | str join '/')
    $"(ansi blue)\(\u{e81d} ($k_prompt)\)(ansi reset)"
  } else {
    ""
  }
}