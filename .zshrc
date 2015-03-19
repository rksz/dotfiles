# ------------------------------------------------------------
# LANG
# ------------------------------------------------------------
export LANG=ja_JP.UTF-8
export LEuSCHARSET=utf-8

# ------------------------------------------------------------
# Prompt Settings
# ------------------------------------------------------------
autoload colors
colors

DEFAULT=$'%{\e[1;0m%}'
RESET="%{${reset_color}%}"
GREEN="%{${fg[green]}%}"
BLUE="%{${fg[blue]}%}"
RED="%{${fg[red]}%}"
CYAN="%{${fg[cyan]}%}"
WHITE="%{${fg[white]}%}"

setopt prompt_subst
PROMPT="${RESET}${BLUE}[%D{%T}][%C]${RESET}${WHITE}$ ${RESET}"

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ------------------------------------------------------------
# Zshrc setopt
# ------------------------------------------------------------
# setopt auto_cd              # 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_pushd           # cd でTabを押すとdir list を表示
setopt pushd_ignore_dups    # ディレクトリスタックに同じディレクトリを追加しないようになる
setopt hist_ignore_dups
# setopt correct              # コマンドのスペルチェックをする
# setopt correct_all          # コマンドライン全てのスペルチェックをする
#setopt no_clobber           # 上書きリダイレクトの禁止
setopt list_packed          # 補完候補リストを詰めて表示
setopt list_types           # auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt auto_list            # 補完候補が複数ある時に、一覧表示する
setopt magic_equal_subst    # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt auto_param_keys      # カッコの対応などを自動的に補完する
setopt auto_param_slash     # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt brace_ccl            # {a-c} を a b c に展開する機能を使えるようにする
setopt auto_menu            # 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt noautoremoveslash    # 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除かない
setopt hist_ignore_all_dups # 登録済コマンド行は古い方を削除
setopt share_history        # historyの共有
setopt hist_reduce_blanks   # 余分な空白は詰める
autoload -U compinit        # 自動保管
# bindkey "^W" forward-word   # ctrl-w, ctrl-bキーで単語移動
# bindkey "^B" backward-word  # ctrl-w, ctrl-bキーで単語移動
bindkey "^?" backward-delete-char
compinit -C

# ------------------------------------------------------------
# Common Aliases
# ------------------------------------------------------------
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias lg="ls | grep "
# process
alias pk='pkill -f'
alias allnice="ionice -c2 -n7 nice -n19"
# du/df
alias du="du -h"
alias df="df -h"
alias duh="du -h ./ --max-depth=1"
# su
alias su="su -l"
# vim
alias n="vim -c NERDTreeToggle"
alias v="vim"
alias md='vim ./*.md'
alias mmd='mvim ./*.md'
alias evs='vim ~/.ssh/config'
# grep
alias gr='grep --color=auto -ERUIn'
# tmux
alias tm='tmux'
alias tma='tmux attach'
# dirjump
alias up='cd ..; ll'
alias upp='cd ../..; ll'
alias u='up'
alias b='cd -'
#alias ls='ls -al'
alias cp='nocorrect cp -irp'
alias refe='nocorrect refe'
alias g='git'
alias gs='git status -sb'
alias gss='git status --porcelain | sed s/^...//'
alias gc='git commit'
alias ga='git add .'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gf='git fetch'
alias gb='git branch -avv'
alias gu='git add -u && git commit -am "update" && git push'
# dstat
alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-cpu='dstat -Tclr'
alias dstat-net='dstat -Tclnd'
alias dstat-disk='dstat -Tcldr'
# autojump
# alias j='z'
alias ssh='env TERM=xterm ssh'
alias ssheuc='env TERM=xterm cocot -t UTF-8 -p EUC-JP ssh '
alias t="\task" # taskwarrior
alias be='bundle exec' # bundler
alias wk="cd ~/workspace"
alias gsp='git status --porcelain | sed s/^...// | peco | ruby -pe "chomp" | pbcopy'
alias s='sshpeco'
sshpeco () {
    peco_query=$@
    target=$(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|peco --query="$peco_query"|awk "{print \$2}")
    if [ ! -z $target ]; then
        ssh $target
    fi
}

alias j='z'
alias jp='cd $(z | peco | awk "{print \$2}")'
alias c='changedir_with_peco'
changedir_with_peco() {
    peco_query=$@
    cd $(ls -F --color=never| grep / | peco --query="$peco_query")
}
alias h='vim /etc/hosts'
alias sshconfig='vagrant ssh-config >>~/.ssh/config'
alias -g V="| vim -"
alias -g O="| xargs open"
alias -g L="| less"
alias -g H="| head"
alias -g Z="| tar -cvzf files_$(date +%Y%m%d%H%M%S).tgz --files-from=-"
alias -g G="| grep"
alias -g S="| sed"
alias -g R="| rsync -av --files-from=- . /tmp/"
alias -g P="| peco | ruby -pe 'chomp' | pbcopy"
alias -g C="| tr -d '\n' | pbcopy"
alias -g ls="ls --color"
vp() {
    vim $(find . -iname "*${1}*" | grep -v "/\." | peco)
}
cleanup () {
    find . -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
    find . -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
}
memo() {
    today=$(date "+%Y%m%d")
    memofile=memo-${today}.md
    memofile_past=$(find * -type f -maxdepth 1| grep "memo-" | grep ".md" | sort | tail -1)
    if [[ -f $memofile_past && $memofile != $memofile_past ]]; then
        # vim $memofile_past $memofile -c "vs" -c "bn" -c "NERDTreeToggle" -c "wincmd ="
        vim $memofile_past $memofile -c "vs" -c "bn" -c "wincmd ="
    else
        vim $memofile
    fi
}
agvim () {
  vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}
alias m='vim $(find * -type f -maxdepth 1| grep "memo-" | grep ".md" | sort | tail -1)'
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
# ------------------------------------------------------------
# Custom Aliases
# ------------------------------------------------------------
case "${OSTYPE}" in
darwin*)
    export GOPATH="$HOME/.go/"
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    ## one liner for faster loading
    export PATH=/usr/local/opt/coreutils/libexec/gnubin:/Applications/MacVim.app/Contents/MacOS:~/Applications/Vagrant/bin/:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:~/bin:$PATH
    #export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:~/bin:$PATH
    #export PATH=~/Applications/Vagrant/bin/:$PATH
    #export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH
    #export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    #export PATH=$GOPATH/bin:$PATH
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
    alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
    alias mi="open $1 -a ~/Applications/mi.app/Contents/MacOS/mi"
    alias sourcetree='open -a SourceTree'
    alias st='sourcetree .'
    alias git=hub # hub command - eval "$(hub alias -s)"
    # eval "$(rbenv init - zsh)" Ruby
    alias cp="nocorrect gcp -i" # required: brew install coreutils
    alias tmux="env TERM=screen-256color-bce tmux" #keep vim colorscheme in tmux mode
    alias tma='env TERM=screen-256color-bce tmux attach'
    alias lst='tmux ls'
    alias tls='tmux ls'
    alias ssh256='env TERM=xterm-256color /usr/bin/ssh'
    alias rename='tmux rename-session'
    alias renamew='tmux rename-window'
    alias tailf='tail -f'
    alias p='pbcopy'
    alias f='open .'
    function here() {
        tmux rename-window $(basename `pwd`)
    }
    function dic() {
        w3m "http://ejje.weblio.jp/content/$1" | grep "用例"
    }
    function cdf() {
      target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
      if [ "$target" != "" ]; then
        cd "$target"; pwd
      else
        echo 'No Finder window found' >&2
      fi
    }
    function lnw() {
        project_path=~/workspace/${1:?}
        if [ -d $project_path ]; then
            ln -s $project_path .
        else
            echo "[Error] Project not found." 1>&2
            echo "------------------------"
            ls ~/workspace/
        fi
    }
;;
linux*)
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    alias ls='ls -alh --color'
    alias vi='/usr/bin/vim'
    alias vim='/usr/bin/vim'
;;
esac

# [ -f ~/.zshrc.alias.local ] && source ~/.zshrc.alias.local

# ------------------------------------------------------------
# Custom App
# ------------------------------------------------------------
export PATH=${HOME}/dotfiles/bin:$PATH
. ${HOME}/dotfiles/bin/z.sh
