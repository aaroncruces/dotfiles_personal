

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

# https://getantidote.github.io/install
# source antidote (path installed with git)
#source ${ZDOTDIR:-~}/.antidote/antidote.zsh

source /usr/share/zsh-antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
# The following lines were added by compinstall

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#  /PLUGINS
#---------------------------------



