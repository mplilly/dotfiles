# dotfiles
my linux configuration files

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


# tmux
copy tmux.conf to ~/.tmux.conf

