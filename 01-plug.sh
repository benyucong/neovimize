sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

INIT_PREFIX=$HOME/.config/nvim

mkdir -p $INIT_PREFIX
cp ./init.vim $INIT_PREFIX

nvim -c "PlugInstall" -c "qa!"
mkdir -p $INIT_PREFIX/colors
if [ -z $INIT_PREFIX/colors/minimalist.vim ]; then
  ln -s $HOME/.vim/bundle/minimalist/colors/minimalist.vim $INIT_PREFIX/colors/minimalist.vim
fi

nvim -c "CocInstall coc-clangd" -c "qa!"
nvim -c "CocInstall coc-rust-analyzer" -c "qa!"
nvim -c "CocInstall coc-jedi" -c "qa!"
nvim -c "CocInstall coc-json" -c "qa!"
nvim -c "CocInstall coc-lua" -c "qa!"
