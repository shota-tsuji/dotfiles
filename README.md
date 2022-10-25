# Portable Configuration Files
## peco
```shell
mkdir $HOME/.config/peco/
ln -s $(readlink -f .peco/config.json) $HOME/.config/peco/
```

## fish
```shell
ln -s $(readlink -f config.fish) $HOME/.config/fish/
```

## Starship
```shell
ln -s $(readlink -f starship.toml) $HOME/.config/
```

## zsh
```shell
ln -s $(readlink -f .zshrc) $HOME/.zshrc
ln -s $(readlink -f .zsh) $HOME/.zsh
git clone https://github.com/zsh-users/antigen.git ~/antigen
```
