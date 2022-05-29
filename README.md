# dotfiles
my linux configuration files

# for linux
* install: neovim, tmux, fonts-firacode, zsh, exa
* settings: natural scrolling, night light

# Plug-in manager

# vim-plug for neovim (mac)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim-plug for vim (mac)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Vundle (if not using vim-plug)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
then copy the vimrc file to ~/vimrc

# terminfo
make a drectory ~/.terminfo
run:
tic -o $HOME/.terminfo tmux.terminfo
tic -o $HOME/.terminfo tmux-256color.terminfo
tic -o $HOME/.terminfo xterm.terminfo

# configuration
* make folders ~/.config/tmux and ~/.config/zsh
* echo "export ZDOTDIR=~/.config/zsh" > .zshenv
```
ln -sf ~/projects/dotfiles/zshrc ~/.config/zsh/.zshrc
ln -sf ~/projects/dotfiles/tmux.conf ~/.config/tmux/tmux.conf

# zsh
* clone softmoth/zsh-vim-mode, chriskempson/base16-shell, spaceship-prompt/spaceship-prompt (--depth=1)
```
* after logout/login
```
ln -sf ~/projects/spaceship-prompt/spaceship.zsh /usr/local/share/zsh/site-functions/prompt/spaceship/setup


# tmux
copy tmux.conf to ~/.tmux.conf
or
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

# bash
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
