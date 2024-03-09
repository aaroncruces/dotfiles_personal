

#---------------------------------
#  ZSH FIXES

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
# deactivatre annoying beep beep molesto
unsetopt BEEP
#  /ZSH FIXES
#---------------------------------

#---------------------------------
#  AUTORUNS




#  /AUTORUNS
#---------------------------------

#---------------------------------
#  ALIAS

alias ls='ls --color=auto'
alias la='ls -la --color=auto'

alias v='nvim'

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
alias tmux="TERM=xterm  tmux -2"
alias ssh='TERM="xterm-256color" kitty +kitten ssh'

#  /ALIAS
#---------------------------------

#---------------------------------
#  PATH
# export MANPATH=$HOME/.local/texlive/TEXDIR/texmf-dist/doc/man:$MANPATH
# export INFOPATH=$HOME/.local/texlive/TEXDIR/texmf-dist/doc/info:$INFOPATH

# export PATH=$HOME/.local/texlive/TEXDIR/bin/x86_64-linux:$PATH
#export PATH=$HOME/.local/bin:/snap/bin:$PATH

export PATH=$HOME/.local/bin:$PATH

#  /PATH
#---------------------------------

#---------------------------------
#  AUTOCOMPLETE

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle :compinstall filename '~/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

#  /AUTOCOMPLETE
#---------------------------------



#---------------------------------
#  PLUGINS

source /usr/share/zsh-antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt


#  /PLUGINS
#---------------------------------



