HISTSIZE=16777216
SAVEHIST=16777216
setopt beep extendedglob nomatch notify
unsetopt autocd

# no idea what is that
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

# atuin
# TODO: up arrow showing history not only from currect session, i want atuin to be only for ctrl+r because i care about stats mostly, and i think it's slowing me down
local FOUND_ATUIN=$+commands[atuin]
if [[ $FOUND_ATUIN -eq 1 ]]; then
  source <(atuin init zsh --disable-up-arrow)
fi

# colors
alias lf="ls --color=never"
alias ls="ls -v --color=auto"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias cmatrix="cmatrix -C cyan -u 1"

# short commands
alias l="ls -l"
alias la="ls -A"
alias n="nano"
alias v="nvim"
alias c="cat"
alias cl="clear"
alias cls="clear && ls"

# mv
alias mv="mv --interactive"

# too much neovim
alias :q="exit"
alias :wq="sync && exit"
alias :w="sync"
# TODO: USE HYPRCTL TO ONLY KILL THOSE WINDOWS WHICH ARE ON THE SAME WORKSPACE
alias :qa="killall alacritty"

# git stuff
alias gs="git status"
alias gd="git diff"
alias gw="git diff --word-diff"
alias gb="git branch --all"
alias gc="git checkout" # it`s not git commit to slow me down. I need to think before commits, otherwise I would do something dumb. (I commit dumb things anyway, that`s why I dont even have alias for push)
alias gp="git pull"
alias gu="git remote show origin | grep 'URL'"
alias gt="git log --oneline | wc -l"
alias gl="git log --oneline"
alias gds="git diff --stat"
alias gwc="git whatchanged"

# npm stuff
alias npl="npm ls"
alias nprd="npm run dev"
alias npr="npm run"
alias npbs="npm run build && npm run start"

# go stuff
alias gr="go run"

# other
alias iw="iwctl"
alias ff="fzf"
alias hyprexit="sync && hyprctl dispatch exit"
alias is="gh issue list"
alias fs="du -s * | sort -n"
alias at="tmux attach"
alias force="GOPROXY=direct"

# gcc g++, TODO: maybe no -fbuiltin in gcc.
alias bgcc="gcc -std=c23 -Wall -Wextra -pedantic -O2 -fexpensive-optimizations -fmerge-constants -fmerge-all-constants -fmerge-debug-strings -fmove-loop-invariants -fsigned-char -fwhole-program -faggressive-loop-optimizations -fasm -fbuiltin"
alias bzgcc="zig cc -std=c23 -Wall -Wextra -pedantic -O2 -fexpensive-optimizations -fsigned-char -fwhole-program -fasm -fbuiltin"
alias sgcc="bgcc -fsanitize=address -fsanitize=bounds -fsanitize=enum -fsanitize=float-divide-by-zero -fsanitize=integer-divide-by-zero -fsanitize=null -fsanitize=return -fsanitize=signed-integer-overflow -fsanitize=unreachable"
alias szgcc="bzgcc -fsanitize=address -fsanitize=bounds -fsanitize=enum -fsanitize=float-divide-by-zero -fsanitize=integer-divide-by-zero -fsanitize=null -fsanitize=return -fsanitize=signed-integer-overflow -fsanitize=unreachable"
alias sg++="g++ -std=c23 -Wall -Wextra -pedantic -O2"

# wf-recorder
alias record="wf-recorder -a -B 60 -c av1_vaapi -D"

# making gpg work so i can sign commits
export GPG_TTY=$(tty)

# usefull commands
ntmp() {
    (cd $(mktemp --directory -p /tmp) && zsh)
}

ch() {
    echo $(cat $HISTFILE | fzf +s)
}

h() {
    $(cat $HISTFILE | fzf +s)
}

p() {
    basename $(pwd)
}

cdl() {
    A=$(echo -e "$(ls -1t --color=never)\n..\n~" | fzf +s)
    # var is empty if you do something like ctrl+c or ctrl+d in fzf
    if [[ "${A}" =~ '^[[:space:]]*$' ]]; then
        ls
        return
    fi
    if [ -f "$A" ]; then
        nvim $A && cdl;
    elif [ -d "$A" ]; then
        cd $A && cdl;
    else
        cdl;
    fi
}

# TODO, ALL ARGS
lse() {
    ls *.$1
}

# usage: mv_dir_atmfile DIR1 DIR2
# mv on every file in DIR1 to DIR2, displays which file is moved right now
# TODO: COUNT FILES AND DISPLAY HOW MANY FILES ARE LEFT TO MOVE
mv_dir_atmfile() {
    for d in $1/* ; do (ls "$d" && mv --interactive "$d" $2); done
}


# TODO, HOW DO I GET LAST ARG, I HATE SHELLS. I WANT TO DO  watch on `du -sh` on original and copied dir 
bcp() {
    cp $* &
}

# slow, count files. there is no command for it afaik
ct() {
    if [[ "$1" =~ '^[[:space:]]*$' ]]; then
        du -sh * | wc -l;
    else
        cd $1; du -sh * | wc -l; cd $OLDPWD
    fi
}

:3() {
    echo ":3"
}

# TOOD: CHECK IF THERE IS MAKEFILE, IF THERE IS, EXECUTE MAKE, IF NOT THEN CHECK FOR BUILD.SH
build() {
    ./build.sh
}

gitundopls() {
    git reset HEAD~
    zsh
    git commit -c ORIG_HEAD
}

img_pal() {
    p=$(mktemp -u --suffix=.png)
    ffmpeg -i "$1" -vf "palettegen" -y $p 2> /dev/null &&
    eog $p
    rm -f $p
}

apple_album_metadata() {
    for d in ./*.albummetadata; do {echo "$d"; exiftool "$d" | grep "Objects  " | tail -c +35; echo ""; }; done;
}

view_csv() {
    column -s, -t < $1 | less "-#2" -N -S
}

randomsi() {
    head -c8 </dev/urandom|xxd -p -u | tr '[:upper:]' '[:lower:]'
}

npltb() {
    npm run lint &&
    npm run test &&
    npm run build
}

wlsu() {
    sudo --preserve-env=XDG_SESSION_TYPE --preserve-env=WAYLAND_DISPLAY --preserve-env=DISPLAY --preserve-env=XGD_BACKEND --preserve-env=XDG_RUNTIME_DIR --preserve-env=XDG_SESSION_TYPE -u $1 zsh
}

dir_all_png_to_webp() {
    for img in *; do ffmpeg -i "$img" -c:v libwebp -lossless 1 "${img%.*}.webp"; done
}

export PATH="$PATH:/home/arajtav/.local/bin"
