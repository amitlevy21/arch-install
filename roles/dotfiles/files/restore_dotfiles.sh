#!/bin/sh

function dotf {
  /usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $@
}

cd $HOME
git clone --bare https://gitlab.com/amitlevy/dotfiles.git .dotfiles.git

# move stock files that might cause issues
mkdir -p .config-backup && \
dotf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

dotf checkout
dotf config --local status.showUntrackedFiles no

