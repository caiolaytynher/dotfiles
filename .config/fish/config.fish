# Disable fish welcome message
set fish_greeting 

# Disable virtual env prompt (I use starship)
set VIRTUAL_ENV_DISABLE_PROMPT "1" 

# Set the environment variable depending on qtile existence
if type "qtile" >> /dev/null 2>&1 # similar to type -q, but includes the errors
  set -x QT_QPA_PLATFORMTHEME "qt5ct"
end


if status --is-interactive
  # Commands to run in interactive sessions, i.e. connected to a keyboard
  # NOTE: type -q <command> checks the existence of that command

  # Activate vim mode
  fish_vi_key_bindings

  if type -q python
    abbr --add --global venv "python -m venv .venv"
    abbr --add --global activate "source .venv/bin/activate.fish"
  end

  if type -q nvim
    abbr --add --global vim 'nvim'
  end

  if type -q zoxide
    zoxide init fish | source

    abbr --add --global cd 'z'
    abbr --add --global cdi 'zi'
  end

  if type -q starship
    starship init fish | source
  end

  if type -q exa
    abbr --add --global ls 'exa -lbh --no-time --group-directories-first --icons --git'
    abbr --add --global la 'exa -labh --no-time --group-directories-first --icons --git'
    abbr --add --global tree 'exa --tree'
  end
  
  if type -q bat
    abbr --add --global cat 'bat'
  end

  if type -q rg
    abbr --add --global grep 'rg'
  end

  # if test -f ~/Programs/Odin/odin
  #   abbr --add --global odin '~/Programs/Odin/odin'
  # end

  if test -f ~/.bun/bin/bun
    abbr --add --global bun '~/.bun/bin/bun'
    abbr --add --global bunx '~/.bun/bin/bunx'
  end

  if test -f ~/go/bin/air
    abbr --add --global air '~/go/bin/air'
  end

  if test -f ~/.pyenv/bin/pyenv
    abbr --add --global pyenv '~/.pyenv/bin/pyenv'
  end

  abbr --add --global femm 'wine ~/.wine/drive_c/femm42/bin/femm.exe'
end

