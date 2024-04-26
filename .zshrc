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
alias lf="ls --color=never"
alias ls="ls -v --color=auto"
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
alias cls="clear && ls"

# too much neovim
alias :q="exit"

# git stuff
alias gs="git status"
alias gd="git diff"
alias gw="git diff --word-diff"
alias gb="git branch"
alias gc="git checkout" # it`s not git commit to slow me down. I need to think before commits, otherwise I would do something dumb. (I commit dumb things anyway, that`s why I dont even have alias for push)
alias gp="git pull"
alias gu="git remote show origin | grep 'URL'" # it's useful I swear

# npm stuff
alias npi="npm i"
alias npl="npm ls"
alias nprd="npm run dev"
alias npr="npm run"
alias npbs="npm run build && npm run start"

# go stuff
alias gr="go run"

# other
alias iw="iwctl"
alias ff="fzf"
alias hyprexit="hyprctl dispatch exit"
alias iss="gh issue list"
alias fsz="du -s * | sort -n"
alias at="tmux attach"
alias force="GOPROXY=direct"

# wf-recorder
alias srecord="wf-recorder -a -r 60"

# making gpg work so i can sign commits
export GPG_TTY=$(tty)

# usefull commands
ntmp() {
    number=$RANDOM
    mkdir /tmp/$number
    (cd /tmp/$number && zsh)
}

h() {
    $(cat $HISTFILE | fzf)
}

cdl() {
    B=$(ls -1)
    if [ -z "{$B}" ]; then
        return
    fi

    A=$(echo $B | fzf)
    if [[ "${A}" =~ '^[[:space:]]*$' ]]; then
        return
    fi
    cd $A && cdl
}
