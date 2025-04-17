# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.EDITOR = "nvim"

$env.DOTFILES = $"($env.HOME)/dotfiles"

### ASDF
let shims_dir = (
  if ( $env | get --ignore-errors ASDF_DATA_DIR | is-empty ) {
    $env.HOME | path join '.asdf'
  } else {
    $env.ASDF_DATA_DIR
  } | path join 'shims'
)

$env.PATH = ( $env.PATH | split row (char esep) | where { |p| $p != $shims_dir } | append $shims_dir )
# asdf completion nushell | save $"($env.HOME)/.asdf/completions/nushell.nu"

let asdf_data_dir = (
  if ( $env | get --ignore-errors ASDF_DATA_DIR | is-empty ) {
    $env.HOME | path join '.asdf'
  } else {
    $env.ASDF_DATA_DIR
  }
)
# . "$asdf_data_dir/completions/nushell.nu"

### FZF
$env.PATH = ( $env.PATH | split row (char esep) | append '~/.fzf/bin' )
###

### Krew
$env.PATH = ( $env.PATH | split row (char esep) | append '~/.krew/bin' )
###

### Aliases
source ~/dotfiles/nushell/aliases.nu 

### Plugins

$env.PATH = ( $env.PATH | append ~/.cargo/bin )
$env.NU_PLUGIN_DIRS = ( $env.NU_PLUGIN_DIRS | append ~/.cargo/bin )
source "~/.cargo/env.nu"

plugin add nu_plugin_gstat

###

### Prompt

## TODO: Move this to module"
def kube_prompt [] {
  let cmd = (history | last 1 | get command.0 | default "")
  if ($cmd | str starts-with 'k') {
    let k_prompt =  ([(kubectl ctx -c), (kubectl ns -c)] | str trim | str join '/')
    $"(ansi yellow)($k_prompt)(ansi reset)"
  } else {
    ""
  }
}

use "~/dotfiles/nushell/modules/prompt/oh-my.nu" git_prompt
$env.PROMPT_COMMAND = { $"((git_prompt).left_prompt) (kube_prompt)" }
$env.PROMPT_COMMAND_RIGHT = { (git_prompt).right_prompt }
$env.PROMPT_INDICATOR = "\n"
###
