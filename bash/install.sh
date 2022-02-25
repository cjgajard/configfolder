. `dirname ${BASH_SOURCE}`/../bash/lib/configfolder.sh

configfolder_bash() {
  configfolder_install bash/bashrc $HOME/.bashrc
  configfolder_install bash/profile $HOME/.profile
}

if [ $0 == "$BASH_SOURCE" ]; then
  configfolder_ask "Install bash?" && configfolder_bash
  exit 0
fi
