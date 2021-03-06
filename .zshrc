# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/giovanni/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="intheloop"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python docker docker-compose)

source ~/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle python
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

zmodload zsh/terminfo

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
      timer_show=$(($SECONDS - $timer))
      aux_mins=$((timer_show / 60))
      aux_hours=$((aux_mins / 60))
      days=$((aux_hours / 24))
      hours=$((aux_hours - 24*days))
      mins=$((aux_mins - 60*aux_hours))
      secs=$((timer_show - 60*aux_mins))

      if [ $days -gt 0 ]; then
	  export RPROMPT="%F{cyan}${days}d${hours}h${mins}m${secs}s %{$reset_color%}"
      elif [ $hours -gt 0 ]; then
	  export RPROMPT="%F{cyan}${hours}h${mins}m${secs}s %{$reset_color%}"
      elif [ $mins -gt 0 ]; then
	  export RPROMPT="%F{cyan}${mins}m${secs}s %{$reset_color%}"
      else
	  export RPROMPT="%F{cyan}${secs}s %{$reset_color%}"
      fi
      unset timer
  fi
}

# added by Anaconda3 4.3.0 installer
# export PATH="/home/giovanni/anaconda3/bin:$PATH"  # commented out by conda initialize  # commented out by conda initialize
source $ZSH/oh-my-zsh.sh
alias gg='git log --color --all --graph --format="%C(yellow)%h%C(reset) %C(green)%d%Creset %s %C(blue)[%cN]%Creset"'

alias jn='jupyter notebook'
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/giovanni/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/giovanni/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/giovanni/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/giovanni/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias sshaline='ssh ubuntu@aline'
alias sshadam='ssh -t tcruser@adam "zsh"'
alias sshlindsey='ssh -t root@lindsey "zsh"'

print-time() {
    print -P '%F{yellow} %D{Date: %F Time: %T}%f'
}
preexec_functions+=(print-time)
