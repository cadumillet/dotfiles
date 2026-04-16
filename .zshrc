# Only apply custom dotfile config in Codespaces
[[ "$CODESPACES" != "true" ]] && return

short_pwd() {
  basename "$PWD"
}

git_branch_info() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n $branch ]]; then
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
      echo "%B%F{yellow}${branch}*%b%f"
    else
      echo "%B%F{blue}${branch}%b%f"
    fi
  fi
}

git_info() {
  local branch_info=$(git_branch_info)
  if [[ -n $branch_info ]]; then
    echo "(${branch_info})"
  fi
}

set_prompt() {
  local current_dir="%F{magenta}$(short_pwd)%f"
  local git="$(git_info)"
  local node_info="%F{green}$(node -v 2>/dev/null)%f"
  PROMPT="${current_dir} ${git} ${node_info}
➜ "
}

autoload -U add-zsh-hook
add-zsh-hook chpwd set_prompt
add-zsh-hook precmd set_prompt

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

alias reload="source ~/.zshrc"

alias st="git st"
alias cm="git cm"
alias lp="git lp"
