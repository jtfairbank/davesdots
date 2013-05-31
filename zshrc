# .zshrc
#  Current author: Taylor Fairbank (jtfairbank)
# Original author: David Majnemer
#                  Saleem Abdulrasool <compnerd@compnerd.org>
# vim:set nowrap:

case `uname -s` in
	Darwin)
		export LHOSTNAME=`scutil --get LocalHostName`
	;;
	*)
		export LHOSTNAME=${HOST}
	;;
esac

autoload compinit; compinit -d "${HOME}/.zsh/.zcompdump-${LHOSTNAME}"

autoload age
autoload zmv

if [ ${ZSH_VERSION//.} -gt 420 ] ; then
	autoload -U url-quote-magic
	zle -N self-insert url-quote-magic
fi

autoload -U edit-command-line
zle -N edit-command-line

# Keep track of other people accessing the box
watch=( all )
export LOGCHECK=30
export WATCHFMT=$'\e[00;00m\e[01;36m'" -- %n@%m has %(a.logged in.logged out) --"$'\e[00;00m'

# directory hashes
if [ -d "${HOME}/sandbox" ] ; then
	hash -d sandbox="${HOME}/sandbox"
fi

if [ -d "${HOME}/work" ] ; then
	hash -d work="${HOME}/work"

	for dir in "${HOME}"/work/*(N-/) ; do
		hash -d $(basename "${dir}")="${dir}"
	done
fi

# common shell utils
if [ -d "${HOME}/.commonsh" ] ; then
	for file in "${HOME}"/.commonsh/*(N.x:t) ; do
		. "${HOME}/.commonsh/${file}"
	done
fi

# extras
if [ -d "${HOME}/.zsh" ] ; then
	for file in "${HOME}"/.zsh/*(N.x:t) ; do
		. "${HOME}/.zsh/${file}"
	done
fi

# locale for Python-Djagno Superuser Creation
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# for Aircrack install via homebrew
export PATH=$PATH:/usr/local/sbin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# for homebrew
export PATH="/usr/local/bin:$PATH"

# dart sdk location
export DART_SDK="/Applications/dart/dart-sdk"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# path to z
. ~/Programming/Tools/z/z.sh

# path to android sdk
export ANDROID_HOME=~/Programming/android-sdk-macosx
export PATH=~/Programming/android-sdk-macosx/platform-tools:~/Programming/android-sdk-macosx/tools:$PATH
