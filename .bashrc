# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Activate vim mode
set -o vi

if command -v exa >/dev/null 2>&1; then
	alias ls='exa -lb --no-time --group-directories-first --icons --git --header'
	alias la='exa -lab --no-time --group-directories-first --icons --git --header'
	alias tree='exa --tree'
fi

if command -v bat >/dev/null 2>&1; then
	alias cat='bat'
fi

if command -v rg >/dev/null 2>&1; then
	alias grep='rg'
fi

if command -v starship >/dev/null 2>&1; then
	eval "$(starship init bash)"
fi

if command -v zoxide >/dev/null 2>&1; then
	eval "$(zoxide init --cmd cd bash)"
fi

if [ command -v code >/dev/null 2>&1 ] || [ -n "$WAYLAND_DISPLAY" ]; then
	echo "vscode on wayland"
	alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'
fi

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
