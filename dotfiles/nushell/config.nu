# Laoding other modules
source ~/.zoxide.nu

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
