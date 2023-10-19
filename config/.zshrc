# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# usr/local/bin
export PATH="$HOME/bin":"/usr/local/bin":"$PATH"

# mysql
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# golang
export GOPROXY=direct
export GOSUMDB=off

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# ansible
eval "$(direnv hook zsh)"

# gcloud
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# alias
alias gpl='git pull origin "$(git symbolic-ref --short HEAD)"'
alias gps='git push origin "$(git symbolic-ref --short HEAD)"'

# pbcopyで日本語(UTF-8)をコピーできるようにする
__CF_USER_TEXT_ENCODING=0x0:0x8000100:14
export __CF_USER_TEXT_ENCODING

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug b4b4r07/enhancd, use:init.sh
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# function
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

