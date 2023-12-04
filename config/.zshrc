# usr/local/bin
export PATH="$HOME/bin":"/usr/local/bin":"$PATH"

# brew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# mysql
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"

# fvm
export PATH="$HOME/fvm/default/bin:$PATH"

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