#system
alias l='ls -AlhFv --color'
alias ls='ls --color'
alias la='ls -A'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias s='cd ..'
alias bcd='__ebcd'
alias mkcd='__emkcd'
alias rmrf='rm -rf'
alias dfh='df -h'
alias dush='du -sh'
alias bashrc='. ~/.bashrc'

#operations with packages
alias pkgu='sudo apt-get update'
alias pkgi='sudo apt-get install'
alias pkgs='apt-cache search'
alias pkgr='sudo apt-get remove'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#Git
alias gcam='git commit -a -m'
alias gcom='git commit -m'
alias gpush='git push'
alias gco='git checkout'
alias gfe='git fetch'
alias gst='git status'
alias gpull='git pull'
alias gsubup='git submodule update'
alias gsubpull='git submodule foreach git pull'
alias gdiff='git diff'
alias gnewb='git checkout -b'
alias glog='git log --graph --pretty=format:"%h %s | %cn ( %ce )"'
alias glogd='git log --graph --pretty=format:"%Cblue%cr%Creset | %Cred%h %Cgreen%s%Creset| %cn ( %ce )"'
alias gremovehooks='rm .git/hooks/*'
alias gut='git push'
alias gp='git pa'
alias gl='git log --graph --pretty=format:"%Cblue%cr%Creset | %Cred%h %Cgreen%s%Creset| %cn ( %ce )"'
alias gdf='git diff'
alias gbr='git branch -v -a'
alias master='git checkout master'
alias develop='git checkout develop'

#others
alias doc='docker'

#GUI
alias odir='nautilus'

#work
alias mgm='ssh root@management.ls.intra'
alias logserver='ssh -p 2222 lslog@logserver.edrive-hosting.cz'
alias gitolite='ssh git@git.livesport.eu'

#LDAP
alias lskinit='/usr/bin/kinit -r 7d'
