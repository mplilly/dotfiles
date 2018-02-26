# dotfiles
my linux configuration files

# Vundle
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
