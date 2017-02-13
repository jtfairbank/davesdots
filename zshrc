# .zshrc
#  Current author: Taylor Fairbank (jtfairbank)
# Original author: David Majnemer
#                  Saleem Abdulrasool <compnerd@compnerd.org>

# Autoload 
# ------------------------------------------------------------
# compinit
#   - filename completion for zsh
#   - http://www.csse.uwa.edu.au/programming/linux/zsh-doc/zsh_23.html
case `uname -s` in
	Darwin)
		export LHOSTNAME=`scutil --get LocalHostName`
	;;
	*)
		export LHOSTNAME=${HOST}
	;;
esac

autoload compinit; compinit -d "${HOME}/.zsh/.zcompdump-${LHOSTNAME}"

# age
#   - matches the age of a file
#   - ex: print *(e:age 2006/10/04:)
#   - https://github.com/zsh-users/zsh/blob/95c044372a4b945761940de64eed87c30f2d555e/Functions/Calendar/age
autoload age

# zmv
#   - move / rename multiple files
#   - https://github.com/zsh-users/zsh/blob/daa828bc51b48110f0a584fa2b74895d2cc761c1/Functions/Misc/zmv
autoload zmv

# url-quote-magic
#   - helps type urls
#   - https://github.com/zsh-users/zsh/blob/daa828bc51b48110f0a584fa2b74895d2cc761c1/Functions/Zle/url-quote-magic
if [ ${ZSH_VERSION//.} -gt 420 ] ; then
	autoload -U url-quote-magic
	zle -N self-insert url-quote-magic
fi

# edit-command-line
#   - edit the command-line with your usual editor
#   - https://github.com/zsh-users/zsh/blob/daa828bc51b48110f0a584fa2b74895d2cc761c1/Functions/Zle/edit-command-line
autoload -U edit-command-line
zle -N edit-command-line

# Extend zsh Functionality
# ------------------------------------------------------------
# Keep track of people accessing the box
watch=( all )
export LOGCHECK=30
export WATCHFMT=$'\e[00;00m\e[01;36m'" -- %n@%m has %(a.logged in.logged out) --"$'\e[00;00m'

# directory hashes
#   - removed, using z instead.  See https://github.com/rupa/z

# load common shell utils
if [ -d "${HOME}/.commonsh" ] ; then
	for file in "${HOME}"/.commonsh/*(N.x:t) ; do
		. "${HOME}/.commonsh/${file}"
	done
fi

# load extras from .zsh
if [ -d "${HOME}/.zsh" ] ; then
	for file in "${HOME}"/.zsh/*(N.x:t) ; do
		. "${HOME}/.zsh/${file}"
	done
fi

# Enable forward search when using ctrl-r to search the command line history.
stty -ixon

# Customize Prompt
# -----------------------------------------------------------
# Git Branch
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

# Path & Shell Variables for Other Programs
# -----------------------------------------------------------
# Android SDK
#  - SDK for Android dev and rooting
#  - http://developer.android.com/sdk/index.html
export ANDROID_HOME="$HOME/Programming/droid-rootz/android-sdk-macosx"
export PATH="$HOME/Programming/droiz-rootz/android-sdk-macosx/platform-tools:$PATH"
export PATH="$HOME/Programming/droid-rootz/android-sdk-macosx/tools:$PATH"

# Dart SDK
#  - Google's web programming language
#  - http://www.dartlang.org/
export DART_SDK="/Applications/dart/dart-sdk"

# Heroku Toolbelt
#  - tools for interacting with Heroku
#  - https://toolbelt.heroku.com/
export PATH="/usr/local/heroku/bin:$PATH"

# Homebrew
#  - OSX package manager
#  - http://mxcl.github.io/homebrew/
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Node
#  - javascript based server
#  - http://http://nodejs.org/
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"

# Postgres
# - Install Postgres via [Postgres.app](http://postgresapp.com/)
# - [command line docs](http://postgresapp.com/documentation/cli-tools.html)
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Python-Djagno Superuser Creation's locale
#  - A work-around for Django not finding the user's locale.  According tot the
#    bug report, this issue was fixed in Django 1.5.
#  - Django bug report: https://code.djangoproject.com/ticket/16017
#  - Solution: http://od-eon.com/blogs/kaunghtet/locale-error-managepy-createsuperuser/
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Ruby Version Manager (RVM)
#  - "Install, manage, and work with multiple ruby environments from interpreters
#    to sets of gems."
#  - https://rvm.io/
export PATH="$HOME/.rvm/bin:$PATH"

# z
#  - frequent directory navigation
#  - https://github.com/rupa/z
. $HOME/Programming/Tools/z/z.sh
