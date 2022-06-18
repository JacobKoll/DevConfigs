# enable color support of ls and also add handy aliases
# some more ls aliases
alias ll='ls -las'
#alias ll='ls -1F'
alias la='ls -A'
alias l='ls -CF'
alias tmux='tmux -u'

alias denv='activate `pwd`'
alias dinstall='dinstall `pwd`'
alias venv='source csvenv/bin/activate'
alias vinstall='vinstall `pwd` && source csvenv/bin/activate'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

main() {
	python main.py --config configs/config_"$1".yaml
}

test() {
	python -m unittest tests.test_"$1"
}

export TERM=xterm-256color
# for bash not needed for zsh
# export PATH="~/DevConfigs/Scripts/:~/DevConfigs/Scripts/Uml/:$PATH"
path+=(~/DevConfigs/Scripts)
path+=(~/Library/Python/3.9/bin)
export path

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

function sk() {
	USAGE="\033[0;31m - USAGE: k {cluster-context}. \033[0m"
	if [ "$1" = "" ]; then
		echo "$USAGE"
	else
		kubectl config use-context $1
	fi
}

function flylogin() {
	FLY_URL="https://concourse-ci.hy-vee.cloud"
	if [ "$2" = "lab" ]
	then
		FLY_URL="https://concourse-ci-lab.hy-vee.cloud"
	fi
	fly -t "$1" login -b -c "$FLY_URL" -n "$1"
}

function intercept() {
	TEAM=$1; PIPELINE=$2; TASK=$3;
	echo "\033[0;32m+ fly -t $TEAM intercept -j ${PIPELINE}/${TASK}\033[0m"
	fly -t $TEAM intercept -j "${PIPELINE}/${TASK}"
}
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
