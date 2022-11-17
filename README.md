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
curl -sS https://starship.rs/install.sh | sh
ln -s $(readlink -f starship.toml) $HOME/.config/
```

## zsh
```shell
ln -s $(readlink -f .zshrc) $HOME/.zshrc
ln -s $(readlink -f .zsh) $HOME/.zsh
git clone https://github.com/zsh-users/antigen.git ~/antigen
```

## git
```shell
ln -s $(readlink -f .gitconfig) $HOME/.gitconfig
```

## tmux
```shell
ln -s $(readlink -f .tmux.conf) $HOME/.tmux.conf
```

## gvm
```shell
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```
