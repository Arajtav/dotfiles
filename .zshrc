HISTFILE=~/.sec/.histfile # i don't want to have too much stuff in home folder
HISTSIZE=16384
SAVEHIST=16384
setopt beep extendedglob nomatch notify
unsetopt autocd

# no idea what is that
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

# colors
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias cmatrix="cmatrix -C cyan"

# short commands
alias l="ls -l"
alias la="ls -A"
alias n="nano"
alias v="nvim"
alias c="cat"
alias cl="clear"

# too much neovim
alias :q="exit"

# git stuff
alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias gc="git checkout" # its not git commit to slow me down. I need to think before commits, otherwise i would do something dumb
alias gp="git pull"

# npm stuff
alias npi="npm i"
alias npl="npm ls"
alias nprd="npm run dev"

# other
alias iw="iwctl"

# making gpg work so i can sign commits
export GPG_TTY=$(tty)
