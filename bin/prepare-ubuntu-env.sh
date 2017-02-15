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

function secure_content_symlink {

	for dir in $(find $DROPBOX_DIR/UbuntuHomeDir/$1 -mindepth 1 -maxdepth 1); do

		CONTENT=${dir/$DROPBOX_DIR\/UbuntuHomeDir\/$1\//}
		secure_create_symlink $DROPBOX_DIR/UbuntuHomeDir/$1/$CONTENT ~/$2/$CONTENT

	done

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
	secure_create_symlink $DROPBOX_DIR/Music/ ~/Music
	secure_create_symlink $DROPBOX_DIR/Pictures/ ~/Pictures
	secure_create_symlink $DROPBOX_DIR/Documents/ ~/Documents
	secure_create_symlink $DROPBOX_DIR/Videos/ ~/Videos
	secure_create_symlink $DROPBOX_DIR/NetBeansProjects/ ~/NetBeansProjects
	secure_content_symlink config .config

fi

if [ ! -d ~/Software/ ]; then

	mkdir ~/Software/

fi
