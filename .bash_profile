# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

alias be='bundle exec'
# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/usr/pgsql-9.6/bin/

export PATH

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
