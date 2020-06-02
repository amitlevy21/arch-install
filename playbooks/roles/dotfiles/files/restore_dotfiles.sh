#!/bin/sh

function usage {
  echo USAGE: restore_dotfiles.sh git-repo-url
  echo EXAMPLE: restore_dotfiles.sh https://github.com/username/dotfiles.git
}

function dotf {
  /usr/bin/git --git-dir=$HOME/.config/dotfiles.git/ --work-tree=$HOME $@
}

function backup {
  pdir=$(dirname $1)
  mkdir -p $pdir
  mv $1 .config-backup/$1
}

if [ "$#" -ne 1 ]; then
    usage
    exit 2
fi

export -f backup # for the use in xargs

cd $HOME
git clone --bare $1 $HOME/.config/dotfiles.git

# move stock files that might cause issues
mkdir -p .config-backup && \
dotf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} bash -c 'backup "$@"' _ {}

dotf checkout
dotf config --local status.showUntrackedFiles no

unset backup

exit 0

