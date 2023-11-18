export LANG=ja_JP.UTF-8

setopt nonomatch

## prompt
PROMPT="%{${fg[blue]}%}$%{${reset_color}%} "
export PROMPT="%B[%{$fg[default]%}%/]%{$fg[cyan]%} $%b"


## vcs_info

autoload -Uz vcs_info
#PROMPT変数内で変数参照する
setopt prompt_subst
#vcsの表示
zstyle ':vcs_info:git:*' stagedstr '%F{yellow}!'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}+'
zstyle ':vcs_info:*' formats '%F{green}%c%u[%b]%f'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
# プロンプト表示直前にvcs_info呼び出し
precmd() { vcs_info }
# プロンプト表示
PROMPT='${vcs_info_msg_0_}'$PROMPT

## complement

autoload -U compinit; compinit -u
setopt auto_list
setopt auto_menu
setopt list_packed
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


## color

autoload -Uz colors
colors


## history

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
# HISTORY_IGNORE='(ls:ls *:bg:fg:history:cd ..:re)'
setopt hist_ignore_dups
setopt share_history


## ディレクトリ移動

setopt auto_cd
function chpwd() { ls }


## alias

alias re='exec $SHELL -l'
alias la='ls -a'
alias ds='bundle exec cap staging deploy'
alias rake='bundle exec rake'
alias rr='bundle exec rake routes'
alias rdm='bundle exec rake db:migrate'
alias rdc='bundle exec rake db:create'
alias rds='bundle exec rake db:seed'
alias rdr='bundle exec rake db:rollback'
alias be='bundle exec'
alias xcode='open -a /Applications/Xcode.app'
alias ls='ls -G'

mkcd() {
  \mkdir $* && cd $_
}

### rails
alias rs='rails s'
alias rs4='rails s -p 4000'
alias rs5='rails s -p 5000'
alias rc='rails c'

### vim
alias vi='nvim'
alias vim='nvim'
alias vv='nvim ~/.config/nvim/init.vim'
alias vz='nvim ~/.zshrc'

### git
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gm='git commit'
alias gm1='git commit --allow-empty -m "create PR"'
alias gb='git branch'
alias gch='git checkout'
alias gsw='git switch'
alias gs='git status -s'
alias gr='git reset'
alias gp='git pull'
alias grb='git rebase'
alias grb1='git rebase -i HEAD~1'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gg='git grep -i'
alias glo='git log --oneline'
alias gpf='git push --force-with-lease'
alias ghl='cd "$( ghq list --full-path | peco)"'
alias grbauto='git rebase -i --autosquash'

alias hc='hub clone'
alias ts='tig status'
alias tnm='tig --no-merges'

### docker
alias d='docker'
alias dc='docker-compose'
alias ds='docker-sync'

alias del='gmv -f --backup=numbered --target-directory ~/.Trash'
alias cleartrash='\rm ~/.Trash/*'

## keybind
bindkey '^F' forward-word
bindkey '^B' backward-word
# bindkey -r '^w'
bindkey '^g' kill-line
bindkey '^u' backward-kill-line

## less
export LESS="-N"

export MANPAGER='less -R'
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

## tmux
alias t='tmux'
alias tname='tmux new -s'
alias ta='tmux attatch -t'

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

## config

### git
export PATH=/usr/local/bin:$PATH

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
# if [ -x "`which nodenv`" ]; then
  eval "$(nodenv init -)"
# fi
#
# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi


export PATH=$PATH:./node_modules/.bin
# export PATH=$PATH:`npm bin -g`
### python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [ -x "`which pyenv`" ]; then
  eval "$(pyenv init --path)"
fi
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# openFrameworks 
# export OF_ROOT=~/openFrameworks/of_v0.10.1_osx_release
# export PG_OF_PATH=$OF_ROOT



## GOPATH
if [ -x "`which go`" ]; then
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOPATH/bin
fi



## cdr の設定
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true


## git-completion
if [ -x "`which brew`" ]; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

## peco
alias -g P='| peco'
if [ -x "`which peco`" ]; then
    alias ll='ls -lah | peco'
    alias tp='top | peco'
    alias pp='ps aux | peco'

    function peco-select-history() {
        local tac
        if which tac > /dev/null; then
            tac="tac"
        else
            tac="tail -r"
        fi
        BUFFER=$(history -n 1 | eval $tac | awk '!a[$0]++' | peco --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle clear-screen
    }

    autoload -Uz is-at-least
    if is-at-least 4.3.11
    then
        autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
      
        zstyle ':chpwd:*' recent-dirs-max 5000
        zstyle ':chpwd:*' recent-dirs-default yes
        zstyle ':completion:*' recent-dirs-insert both
    fi
    zle -N peco-select-history
    bindkey '^r' peco-select-history

    function peco-cdr () {
        local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N peco-cdr
    bindkey '^t' peco-cdr

    # function peco-kill-process () {
        # ps -ef | peco | awk '{ print $2 }' | xargs kill
        # zle clear-screen
    # }
    # zle -N peco-kill-process
    # bindkey '^xk' peco-kill-process
fi

## git grep edit
if [ -x "`which peco`" ]; then
  alias gg='git-grep-edit'
  git-grep-edit () {
    P=$(git grep -n $1 | peco | awk -F: '{print $1}')
    if [ ${#P} -ne 0 ]; then
        vim ${P};
    fi
  }
fi

## switch branch
gf() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# Switch back to vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kaminoura/sdk/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/kaminoura/sdk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kaminoura/sdk/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/kaminoura/sdk/google-cloud-sdk/completion.zsh.inc'; fi
