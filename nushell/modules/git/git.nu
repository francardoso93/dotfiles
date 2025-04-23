export def git_reset_soft_all []: nothing -> nothing {
  let target_branch = (git rev-parse --abbrev-ref HEAD | str trim)
  git checkout main
  git pull
  git checkout $target_branch
  let count = (git rev-list --left-right --count $"main...($target_branch)" | awk '{print $2}' | str trim)
  git reset --soft $"HEAD~($count)"
  git merge main
}