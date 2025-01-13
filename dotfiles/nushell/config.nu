# Laoding other modules
source ~/.zoxide.nu
source ~/.starship.nu

# Main configuration
$env.config = {
  # Disable welcome banner
  show_banner: false
}

# Aliases
alias cls = clear
alias l = ls
alias ll = ls -la
alias cd = z

alias g = git
alias gst = git status
alias ga = git add
alias gd = git diff
alias gc = git commit
alias gf = git fetch
alias gl = git pull
alias gp = git push
alias gco = git checkout
alias gr = git restore
alias grhh = git reset --hard HEAD
