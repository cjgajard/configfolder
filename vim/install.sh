. `dirname ${BASH_SOURCE}`/../bash/lib/configfolder.sh

configfolder_vimplug() {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

configfolder_set_editor() {
  if ! command -v update-alternatives &>/dev/null; then
    return 1
  fi
  # sudo update-alternatives --config editor
  echo '/usr/bin/editor' \
    $(update-alternatives --display editor | grep currently | cut -d' ' -f4-)
}

configfolder_vim() {
  configfolder_ask "Install vimplug?" && configfolder_vimplug
  configfolder_install vim/vimrc $HOME/.vimrc
  configfolder_set_editor
  configfolder_ask "Append runtime at ~/.vimrc?" && \
    echo "set rtp+=$CONFIGFOLDER/vim" >>$HOME/.vimrc
  configfolder_ask "Install vim plugins?" && vim +PlugInstall +qall
}

if [ $0 == "$BASH_SOURCE" ]; then
  configfolder_ask "Install vim?" && configfolder_vim
fi
