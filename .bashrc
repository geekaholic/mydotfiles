source /usr/share/defaults/etc/profile
export EDITOR="vim"

export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:$HOME/bin"

alias mvi='gvim --servername VIM --remote-tab-silent'
alias t='~/bin/ii.do'
alias bookmarks='~/bin/ii.do -f ~/bookmarks.markdown'
alias naughty='history -c && history -w'

#source /usr/etc/bash_completion.d/git-extras
source ~/.git-prompt.sh

#PS1="[\u@\h \W\[\033[01;30m\]\$(__git_ps1)\[\033[00m\]]\$ "
#PS1="\[\033[38;5;081m\]\u\[\033[38;5;245m\]@\[\033[38;5;206m\]\H \[\033[38;5;245m\]\w \[\033[38;5;081m\]$ \[\e[0m\]"
PS1="\[\033[38;5;081m\]\u\[\033[38;5;245m\]@\[\033[38;5;206m\]\H \[\033[38;5;245m\]\W\[\033[01;33m\]\$(__git_ps1) \[\033[38;5;081m\]$ \[\e[0m\]"

# Add some color with powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$@\a\]"
  PS1=${ORIG}${TITLE}
}

