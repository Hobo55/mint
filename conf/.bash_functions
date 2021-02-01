#!/bin/bash

#	.bashrc function- a script file to store
#	 functions for aliases & .bashrc

#		cd and ls files @ same time
###########################################################

function cdl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        exa -a --group-directories-first
        #ls -F --color=auto
        #ls -a
}

#---- prot's cd  -----------------

### Enter directory and list contents
# cd() {
#	if [ -n "$1" ]; then
#		builtin cd "$@" && ls -pvA --color=auto --group-directories-first
#	else
#		builtin cd ~ && ls -pvA --color=auto --group-directories-first
#	fi
# }


#		Function to make directory then go there 
###########################################################

mkd() {
	if [ ! -d "$1" ];
		#test -n "$1" || return; 
	then 
		mkdir -p "$1"; # && cd "$1";
	else 
		echo "$1- Directory already exist.";
		echo "No Directory created.";
	# uncomment next 2 lines to create dir copy
		#echo "Creating $1_1 instead.";
		#mkd "$1_1"
	fi
}

# ex = EXtractor for all kinds of archives
######################################################################

#     usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
#------------------------------------------------

# Back up a file. Usage "backupthis <filename>"
buf() {
	cp -riv $1 ${1}-$(date +%m.%d_%Y).bak;
}
#--------------------------------------------------------------------\\\
