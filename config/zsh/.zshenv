#
# Defines environment variables.
#
# Authors:
#   Filipe Kiss <eu@filipekiss.com.br>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

[[ -f "/etc/environment" ]] && source "/etc/environment"
