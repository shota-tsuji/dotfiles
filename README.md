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

### linux
```shell
ln -s $(readlink -f .zlogin) $HOME/.zlogin
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
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

## vim
```shell
ln -s $(readlink -f .vimrc) $HOME/.vimrc
ln -s $(readlink -f vim-config) $HOME/.vim/vim-config
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/colors/molokai.vim --create-dirs https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
```
Reload .vimrc and `:PlugInstall` to install plugins.

## [gh](https://github.com/cli/cli)
```shell
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```