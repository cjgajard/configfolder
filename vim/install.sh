. `dirname ${BASH_SOURCE}`/../bash/lib/configfolder.sh

configfolder_vimplug() {
  dst=$HOME/.vim/autoload/plug.vim
  mkdir -p `dirname $dst`
  wget -O "$dst" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

configfolder_updateeditor() {
  if ! command -v update-alternatives &>/dev/null; then
    return 1
  fi
  # sudo update-alternatives --config editor
  echo '/usr/bin/editor' \
    $(update-alternatives --display editor | grep currently | cut -d' ' -f4-)
}

configfolder_vimaddruntime() {
  configfolder_ask "Append runtime at ~/.vimrc?" && \
    sed -i "/^filetype off$/a set runtimepath+=$CONFIGFOLDER/vim" \
    $(readlink -f $HOME/.vimrc)
}

configfolder_vim() {
  configfolder_install vim $HOME/.vim
  configfolder_ask "Install vimplug?" && configfolder_vimplug
  configfolder_install vim/vimrc $HOME/.vimrc
  # configfolder_updateeditor
  # configfolder_ask "Append runtime at ~/.vimrc?" && configfolder_vimaddruntime
  configfolder_ask "Install vim plugins?" && vim +PlugInstall +qall
}

if [ $0 == "$BASH_SOURCE" ]; then
  configfolder_ask "Install vim?" && configfolder_vim
  exit 0
fi
