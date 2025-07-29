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

### Aliases
source ~/dotfiles/nushell/aliases.nu 

### ASDF
let shims_dir = (
  if ( $env | get --optional ASDF_DATA_DIR | is-empty ) {
    $env.HOME | path join '.asdf'
  } else {
    $env.ASDF_DATA_DIR
  } | path join 'shims'
)

$env.PATH = ( $env.PATH | split row (char esep) | where { |p| $p != $shims_dir } | append $shims_dir )
# asdf completion nushell | save $"($env.HOME)/.asdf/completions/nushell.nu"

let asdf_data_dir = (
  if ( $env | get --optional ASDF_DATA_DIR | is-empty ) {
    $env.HOME | path join '.asdf'
  } else {
    $env.ASDF_DATA_DIR
  }
)
# . "$asdf_data_dir/completions/nushell.nu"

### FZF
$env.PATH = ( $env.PATH | split row (char esep) | append '~/.fzf/bin' )

### Krew
$env.PATH = ( $env.PATH | split row (char esep) | append '~/.krew/bin' )

# Pulumi
$env.PATH = ( $env.PATH | split row (char esep) | append '~/.pulumi/bin' )

### k8s 
use "~/dotfiles/nushell/modules/k8s/kube-prompt.nu" kube_prompt

# Ruby
$env.PATH = ( $env.PATH | split row (char esep) | append '~/.rbenv/versions/2.7.8/bin' )

### Git Module
use "~/dotfiles/nushell/modules/git/git.nu" *
use "~/dotfiles/nushell/modules/git/oh-my.nu" git_prompt

### Linux Module
use "~/dotfiles/nushell/modules/linux/network.nu" *

## Go
$env.GOPRIVATE = "github.com/Flatbook"

### Debug SAO
# $env.AWS_CLUSTER_NAME = "sonder-staging-1" 
# $env.AWS_REGION = "us-east-1"
# $env.CLOUDFLARE_ENABLE_RECORDS_MANAGEMENT = false
# $env.CLOUDFLARE_ENABLE_RECORDS_TAGGING = false
# $env.CLOUDFLARE_PRIMARY_ZONE_ID = "e6df09e44571aa12153667c5e6a87d96"
# $env.CLOUDFLARE_PRIMARY_ZONE_NAMESPACES = "preview"
# $env.CLOUDFLARE_SECONDARY_ZONE_ID = "afac97ca06a27f883fa69b5abe56c567"
# $env.ENABLE_ORPHAN_RECORDS_DELETION = false
# $env.LOG_LEVEL = "INFO"
# $env.RETRY_MAX_ATTEMPTS = 9
# $env.USE_AWS_STANDARD_EXPONENTIAL_RETRY = true
$env.CLOUDFLARE_API_TOKEN = "Q08j3l7m83HnQ3N1yrYAR2UIUhEn0CJodroOfPtM"
# ### !!! DANGEROUS, COMMENT OUT AFTER DEBUGGING
# $env.AWS_PROFILE = "sonder-staging/aws-admin"

### Plugins
$env.PATH = ( $env.PATH | append ~/.cargo/bin )
$env.NU_PLUGIN_DIRS = ( $env.NU_PLUGIN_DIRS | append ~/.cargo/bin )
source "~/.cargo/env.nu"
plugin add nu_plugin_gstat
# plugin use 'gstat'

### Prompt
$env.PROMPT_COMMAND = { $"((git_prompt).left_prompt) (kube_prompt)" }
$env.PROMPT_COMMAND_RIGHT = { (git_prompt).right_prompt }
$env.PROMPT_INDICATOR = "\n"

