#!/bin/sh

function dotf {
  /usr/bin/git --git-dir=$HOME/.config/dotfiles.git/ --work-tree=$HOME $@
}

function backup {
  pdir=$(dirname $1)
  mkdir -p $pdir
  mv $1 .config-backup/$1
}

export -f backup # for the use in xargs

cd $HOME
git clone --bare https://gitlab.com/amitlevy/dotfiles.git $HOME/.config/dotfiles.git

# move stock files that might cause issues
mkdir -p .config-backup && \
dotf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} bash -c 'backup "$@"' _ {}

dotf checkout
dotf config --local status.showUntrackedFiles no

