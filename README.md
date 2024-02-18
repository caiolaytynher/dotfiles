# Dotfiles

- Alacritty
- Fish
- Bash
- Hyprland
- Neovim
- Rofi
- Swaync
- Waybar
- Zathura
- Starship

## Dependencies

- stow

## Loading dotfiles

If files don't exist

```
$ stow .
```

Otherwise

```
$ stow --adopt .
```

Make sure any symlink already exists before stowing.
