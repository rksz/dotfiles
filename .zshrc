# ------------------------------------------------------------
# ZSH
# ------------------------------------------------------------
export LANG=ja_JP.UTF-8
export LEuSCHARSET=utf-8

#setopt no_clobber           # 上書きリダイレクトの禁止
bindkey "^?" backward-delete-char
setopt auto_list            # 補完候補が複数ある時に、一覧表示する
setopt auto_menu            # 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_param_keys      # カッコの対応などを自動的に補完する
setopt auto_param_slash     # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_pushd           # cd でTabを押すとdir list を表示
setopt brace_ccl            # {a-c} を a b c に展開する機能を使えるようにする
setopt hist_ignore_all_dups # 登録済コマンド行は古い方を削除
setopt hist_ignore_dups
setopt hist_reduce_blanks   # 余分な空白は詰める
setopt list_packed          # 補完候補リストを詰めて表示
setopt list_types           # auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt magic_equal_subst    # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt noautoremoveslash    # 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除かない
setopt prompt_subst
setopt pushd_ignore_dups    # ディレクトリスタックに同じディレクトリを追加しないようになる
setopt share_history        # historyの共有

autoload -U compinit        # 自動保管
autoload colors
colors
# DEFAULT=$'%{\e[1;0m%}'
RESET="%{${reset_color}%}"
# GREEN="%{${fg[green]}%}"
BLUE="%{${fg[blue]}%}"
# RED="%{${fg[red]}%}"
# CYAN="%{${fg[cyan]}%}"
WHITE="%{${fg[white]}%}"
PROMPT="${RESET}${BLUE}[%D{%T}][%C]${RESET}${WHITE}$ ${RESET}"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
compinit -C


# ------------------------------------------------------------
# Common Aliases
# ------------------------------------------------------------
alias -g C="| tr -d '\n' | pbcopy"
alias -g G="| grep"
alias -g H="| head"
alias -g L="| less"
alias -g O="| xargs open"
alias -g P="| peco | ruby -pe 'chomp' | pbcopy"
alias -g R="| rsync -av --files-from=- . /tmp/"
alias -g S="| sed"
alias -g V="| col -bx | vim -R -"
alias -g Z="| tar -cvzf files_$(date +%Y%m%d%H%M%S).tgz --files-from=-"
alias ls="ls --color"
alias allnice="ionice -c2 -n7 nice -n19"
alias be='bundle exec' # bundler
alias c='changedir_with_peco'
alias cp='nocorrect cp -irp'
alias df="df -h"
alias dstat-cpu='dstat -Tclr'
alias dstat-disk='dstat -Tcldr'
alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-net='dstat -Tclnd'
alias du="du -h"
alias duh="du -h ./ --max-depth=1"
alias evs='vim ~/.ssh/config'
# alias g='git'
alias ga='git add .'
alias gb='git branch -avv'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias gs='git status -sb'
alias gsp='git status --porcelain | sed s/^...// | peco | ruby -pe "chomp" | pbcopy'
alias gss='git status --porcelain | sed s/^...//'
alias gu='git add -u && git commit -am "update" && git push'
alias h='vim /etc/hosts'
alias j='z'
alias jp='cd $(z | peco | awk "{print \$2}")'
alias la="ls -a"
alias ll="ls -l"
alias m='vim $(find * -type f -maxdepth 1| grep "memo-" | grep ".md" | sort | tail -1)'
alias md='vim ./*.md'
alias n="vim -c NERDTreeToggle"
alias pk='pkill -f'
alias w='repo'
alias s='sshpeco'
alias ssh='env TERM=xterm ssh'
alias sshconfig='vagrant ssh-config >>~/.ssh/config'
alias ssheuc='env TERM=xterm cocot -t UTF-8 -p EUC-JP ssh '
alias t="\task" # taskwarrior
alias tma='tmux attach'
alias u='up'
alias up='cd ..; ll'
alias v="vim"
alias k="work"

sshpeco () {
    peco_query=$@
    target=$(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|grep -v "*"|peco --query="$peco_query"|awk "{print \$2}")
    if [ ! -z $target ]; then
        ssh $target
    fi
}
changedir_with_peco() {
    peco_query=$@
    cd $(ls -F --color=never| grep / | peco --query="$peco_query")
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
peco-select-history() {
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
repo () {
    peco_query=$@
    dir=$(ghq list -p | peco --query="$peco_query")
    if [[ -d $dir && -n $dir ]]; then
        cd $dir
    fi
}
work () {
    peco_query=$@
    dir=$(find ~/work -type d -maxdepth 2 -mindepth 2 | peco --query="$peco_query")
    if [[ -d $dir && -n $dir ]]; then
        cd $dir
    fi
}
wip () {
    peco_query=$@
    dir=$(find _wip -type d -maxdepth 1 -mindepth 1 | peco --query="$peco_query")
    if [[ -d $dir && -n $dir ]]; then
        cd $dir
    fi
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function man() {
  c=$1
  /usr/bin/man ${c} | col -bx | vim -R -
}


# ------------------------------------------------------------
# Custom Aliases
# ------------------------------------------------------------
case "${OSTYPE}" in
darwin*)
    export GOPATH="$HOME/.go/"
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    export PATH=~/dotfiles/bin:/usr/local/opt/coreutils/libexec/gnubin:/Applications/MacVim.app/Contents/MacOS:~/Applications/Vagrant/bin/:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:~/bin:$GOPATH/bin/:$PATH
    #export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:~/bin:$PATH
    #export PATH=~/Applications/Vagrant/bin/:$PATH
    #export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH
    #export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    #export PATH=$GOPATH/bin:$PATH
    # export PATH=~/dotfiles/bin:$PATH

    # eval "$(rbenv init - zsh)" Ruby
    alias cp="nocorrect gcp -i" # required: brew install coreutils
    alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
    alias f='open .'
    alias git=hub # hub command - eval "$(hub alias -s)"
    alias mi="open $1 -a ~/Applications/mi.app/Contents/MacOS/mi"
    alias rename='tmux rename-session'
    alias sourcetree='open -a SourceTree'
    alias st='sourcetree .'
    alias tailf='tail -f'
    alias tma='env TERM=screen-256color-bce tmux attach'
    alias tmux="env TERM=screen-256color-bce tmux" #keep vim colorscheme in tmux mode
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'

    here() {
        tmux rename-window $(basename `pwd`)
    }
    dic() {
        w3m "http://ejje.weblio.jp/content/$1" | grep "用例"
    }
    cdf() {
      target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
      if [ "$target" != "" ]; then
        cd "$target"; pwd
      else
        echo 'No Finder window found' >&2
      fi
    }
;;
esac

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# ------------------------------------------------------------
# Custom App
# ------------------------------------------------------------
. ~/dotfiles/bin/z.sh
