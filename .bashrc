# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
setPrompt() {
	local status=$?
	local chrt="${debian_chroot:+($debian_chroot)}"
	local red="\[\033[01;31m\]"
	local green="\[\033[01;32m\]"
	local blue="\[\033[01;34m\]"
	local none="\[\033[00m\]"
	if [ $status = 0 ]; then
		PS1="${chrt}${green}\u@\h${none}:${blue}\w${none}$(__git_ps1)\n\$ "
	else
		PS1="${chrt}${red}\u@\h:\w${none} (exit code ${status})$(__git_ps1)\n\$ "
	fi
}
export PROMPT_COMMAND="setPrompt"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Add an "alert" function for long running commands.  Use like so:
#   alert sleep 10
# If you don't want any audio, use the "-q" flag:
#   alert -q sleep 10
function alert() {
	local quiet=false
	if [ "$1" = "-q" ]; then
		quiet=true
		shift
	fi
	cmd="$@"
	eval "$cmd"
	local status=$?
	if [ $status = 0 ]; then
		local icon=terminal
		local say="it's done"
		local message="success"
	else
		local icon=error
		local say="it failed"
		local message="failed (exit code $status)"
	fi
	notify-send --urgency=low -i $icon "$message" "$cmd"
	$quiet || spd-say "$say"
	return $status
}
# Have the alert command use the same tab-completion function as sudo.
complete -F _root_command alert

# Enable programmable completion features. This seems to be necessary for
# __git_ps1 to work.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# Keep *all* of my command history forever.
export HISTFILE=~/.bash_history.infinite
export HISTSIZE=1000000000
export HISTFILESIZE=1000000000
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }history -a"
# Adding time stamps to command history
export HISTTIMEFORMAT="%d/%m/%y %T "

export VISUAL=vim
export EDITOR="$VISUAL"

export GOPATH=/home/anton/gocode
