# -----------------------------------------------------------------------------
# PATH
# -----------------------------------------------------------------------------
export PATH=$PATH:$HOME/.local/bin:$HOME/workspace/opensource/freeplane/BIN

# -----------------------------------------------------------------------------
# git branch in prompt.
# -----------------------------------------------------------------------------
parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
NO_COLOR="\[\033[0m\]"
PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------
alias docker-rmi-dangling='docker rmi $(docker images -f "dangling=true" -q)'
alias lg='lazygit'
alias ls='exa --color=always'
alias freeplane='freeplane.sh'

# This alias allows you to find a file using fzf, determine the root directory of the Git repository containing that file, and open that file in Neovim with the working directory set to the root of the Git repository.
alias nvf='file=$(fzf); nvim -c "cd $(git -C $(dirname $file) rev-parse --show-toplevel)" $file'
# -----------------------------------------------------------------------------
# zoxide
# -----------------------------------------------------------------------------
if command -v zoxide >/dev/null 2>&1; then
	eval "$(zoxide init bash)"
fi

# -----------------------------------------------------------------------------
# SSH
# -----------------------------------------------------------------------------
if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
fi

# -----------------------------------------------------------------------------
# fzf
# -----------------------------------------------------------------------------
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash

# -----------------------------------------------------------------------------
# Miniconda
# -----------------------------------------------------------------------------
export PATH="$HOME/miniconda3/bin:$PATH"
