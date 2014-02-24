#!/bin/bash

function secure_create_symlink {

        if [ -e $2 ]; then

		if [ ! -L $2 ]; then

                	echo backup $2 to $2.backup
			mv $2 $2.backup

		else

			if [ -d $2 ]; then

				rm $2

			fi

		fi

        fi

	ln -sf $1 $2

}

DROPBOX_DIR="$HOME/Dropbox"

if [ "$1" ]; then

	DROPBOX_DIR=$1

fi

if [ -e $DROPBOX_DIR/env/ ]; then

	secure_create_symlink $DROPBOX_DIR/env/bashrc ~/.bashrc
	secure_create_symlink $DROPBOX_DIR/env/profile ~/.profile
	secure_create_symlink $DROPBOX_DIR/env/bash_logout ~/.bash_logout
	secure_create_symlink $DROPBOX_DIR/env/bash_aliases ~/.bash_aliases
	secure_create_symlink $DROPBOX_DIR/env/bash_variables ~/.bash_variables
	secure_create_symlink $DROPBOX_DIR/env/bash_func ~/.bash_func
	secure_create_symlink $DROPBOX_DIR/env/vimrc ~/.vimrc
	secure_create_symlink $DROPBOX_DIR/env/bin/ ~/bin

fi

