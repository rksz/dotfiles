# ------------------------------------------------------------
# ZSH
# ------------------------------------------------------------
export LANG=ja_JP.UTF-8
export LEuSCHARSET=utf-8
typeset -U name_of_the_variable

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
# PROMPT="${RESET}${BLUE}[%D{%T}][%C]${RESET}${WHITE}$ ${RESET}"
PROMPT="${RESET}${BLUE}[%C]${RESET}${WHITE}$ ${RESET}"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
compinit -C

#zle -N limited_autojump_with_peco
## bindkey "^h" limited_autojump_with_peco
#limited_autojump_with_peco () {
#    query=$(pwd)
#    dir=$(z | sort -nr | grep "$query" | awk "{print \$2}" | peco)
#    if [[ -d $dir && -n $dir ]]; then
#        cd $dir
#        echo "ll"
#        ls -al --color
#    fi
#    zle reset-prompt
#}
zle -N autojump_with_peco
bindkey "^j" autojump_with_peco
autojump_with_peco () {
    dir=$(z | sort -nr | awk "{print \$2}" | peco)
    if [[ -d $dir && -n $dir ]]; then
        cd $dir
        echo "ll"
        ls -al --color
    fi
    zle reset-prompt
}

zle -N chrome_history
bindkey "^o" chrome_history
chrome_history() {
  filter=$(cat ~/.chrome_history_filter)
  cat ~/Library/Application\ Support/Google/Chrome/Default/History >/tmp/h
  sqlite3 /tmp/h "select url from urls order by last_visit_time desc"  | egrep $filter | peco | xargs open
}


zle -N chrome_bookmarks
bindkey "^h" chrome_bookmarks
chrome_bookmarks() {
  cat ~/.bookmarks.txt | grep -v "^#" | peco | cut -f 2 -d "|" | xargs open
}
alias b='vim ~/.bookmarks.txt'

# ------------------------------------------------------------
# Common Aliases
# ------------------------------------------------------------
# alias -g C="| tr -d '\n' | pbcopy"
alias -g G="| grep"
alias -g H="| head"
alias -g L="| less"
alias -g O="| xargs open"
alias -g P="| peco | ruby -pe 'chomp' | pbcopy"
alias -g R="| rsync -av --files-from=- . /tmp/"
alias -g S="| sed"
# alias -g V="| col -bx | vim -R -"
alias -g Z="| tar -cvzf files_$(date +%Y%m%d%H%M%S).tgz --files-from=-"
alias ls="ls --color"
alias allnice="ionice -c2 -n7 nice -n19"
alias be='bundle exec' # bundler
alias c='digdir_with_peco_shallow'
alias C='cd -'
# alias vm='vagrant ssh || echo "start running vm..." && vagrant up'
alias vm='vagrant ssh'
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
alias la="ls -a"
alias ll="ls -l"
alias m='vim -c "Unite file_mru"'
alias md='vim ./*.md'
alias n="vim -c NERDTreeToggle -c 'normal O'"
alias pk='pkill -f'
alias w='repo'
alias s='sshpeco'
alias ssh='env TERM=xterm ssh'
alias ssheuc='env TERM=xterm cocot -t UTF-8 -p EUC-JP ssh '
alias t="tmux attach || tmuxnew"
alias tn="tmuxnew"
alias x='mux'
alias u='up'
alias up='cd ..; ll'
alias v="vim"
alias ve="vim -c 'color Tomorrow-Night-Eighties'"
alias vem="vim -c 'color Tomorrow-Night-Eighties' -c 'Unite file_mru'"
alias k="work"
alias X="tmux kill-server"
alias M="mvim ~/Desktop/$(date +%Y%m%d)_tmp.md"

tmuxnew() {
    name=$(basename `pwd`)
    tmux new -s $name
}

findf() {
    target=$(find . -type f -name "*$1*" | egrep -v '.git|vendors|.bundle|.DS_Store|.vagrant|.chef' | peco)
    if [ ! -z $target ]; then
        cd $(dirname $target)
        ls -al
    fi
}
sshpeco () {
    peco_query=$@
    target=$(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|grep -v "*"|awk "{print \$2}" | peco --query="$peco_query")
    if [ ! -z $target ]; then
        ssh $target
    fi
}
digdir_with_peco() {
    peco_query=$@
    dir=$(find  -L . -type d -not -path '*/\.*'| peco --query="$peco_query")
    if [[ -d $dir && -n $dir ]]; then
        cd $dir
        echo ll
        ll
    fi
}
digdir_with_peco_shallow() {
    peco_query=$@
    dir=$(find  -L . -type d -maxdepth 3 -not -path '*/\.*'| peco --query="$peco_query")
    if [[ -d $dir && -n $dir ]]; then
        cd $dir
        echo ll
        ll
    fi
}
cleanup () {
    find . -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
    find . -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
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
zle -N peco-select-history
bindkey '^r' peco-select-history

function man() {
  c=$1
  /usr/bin/man ${c} | col -bx | env EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim $EDITOR -R -
}


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

# ------------------------------------------------------------
# Custom Aliases
# ------------------------------------------------------------
case "${OSTYPE}" in
darwin*)
    export GOPATH="$HOME/.go"
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    export PATH=~/.composer/vendor/bin:~/dotfiles/bin:/usr/local/opt/coreutils/libexec/gnubin:/Applications/MacVim.app/Contents/MacOS:~/Applications/Vagrant/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:~/bin:$GOPATH/bin:$PATH
    #export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:~/bin:$PATH
    #export PATH=~/Applications/Vagrant/bin:$PATH
    #export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH
    #export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    #export PATH=$GOPATH/bin:$PATH
    #export PATH=~/dotfiles/bin:$PATH
    # eval "$(rbenv init - zsh)" Ruby
    alias cp="nocorrect gcp -i" # required: brew install coreutils
    alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
    alias f='open .'
    alias git=hub # hub command - eval "$(hub alias -s)"
    alias mi="open $1 -a ~/Applications/mi.app/Contents/MacOS/mi"
    alias tailf='tail -f'
    alias tma='env TERM=screen-256color-bce tmux attach'
    alias tmux="env TERM=screen-256color-bce tmux" #keep vim colorscheme in tmux mode
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
    alias desk='open ~/Desktop'
    alias sourcetree='open -a SourceTree'
    alias mvim="/Applications/MacVim.app/Contents/MacOS/mvim -c NERDTreeToggle -c 'normal O'"
    alias agg='ag -g'

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
memo() {
    today=$(date "+%Y%m%d")
    memofile=${today}_memo.md
    memofile_past=$(find * -type f -maxdepth 0 | grep "_memo" | grep ".md" | sort | tail -1)
    if [[ -f $memofile_past && $memofile != $memofile_past ]]; then
        # vim $memofile_past $memofile -c "vs" -c "bn" -c "NERDTreeToggle" -c "wincmd ="
        vim $memofile_past $memofile -c "vs" -c "bn" -c "wincmd ="
    else
        vim $memofile
    fi
}

# disabled this temporary for hispeed loading
# [ -f ~/.zshrc.local ] && source ~/.zshrc.local


# ------------------------------------------------------------
# Z https://github.com/rupa/z
# ------------------------------------------------------------
# . ~/dotfiles/bin/z.sh #Loading Z
[ -d "${_Z_DATA:-$HOME/.z}" ] && {
    echo "ERROR: z.sh's datafile (${_Z_DATA:-$HOME/.z}) is a directory."
}

_z() {

    local datafile="${_Z_DATA:-$HOME/.z}"

    # bail if we don't own ~/.z and $_Z_OWNER not set
    [ -z "$_Z_OWNER" -a -f "$datafile" -a ! -O "$datafile" ] && return

    # add entries
    if [ "$1" = "--add" ]; then
        shift

        # $HOME isn't worth matching
        [ "$*" = "$HOME" ] && return

        # don't track excluded directory trees
        local exclude
        for exclude in "${_Z_EXCLUDE_DIRS[@]}"; do
            case "$*" in "$exclude*") return;; esac
        done

        # maintain the data file
        local tempfile="$datafile.$RANDOM"
        while read line; do
            # only count directories
            [ -d "${line%%\|*}" ] && echo $line
        done < "$datafile" | awk -v path="$*" -v now="$(date +%s)" -F"|" '
            BEGIN {
                rank[path] = 1
                time[path] = now
            }
            $2 >= 1 {
                # drop ranks below 1
                if( $1 == path ) {
                    rank[$1] = $2 + 1
                    time[$1] = now
                } else {
                    rank[$1] = $2
                    time[$1] = $3
                }
                count += $2
            }
            END {
                if( count > 9000 ) {
                    # aging
                    for( x in rank ) print x "|" 0.99*rank[x] "|" time[x]
                } else for( x in rank ) print x "|" rank[x] "|" time[x]
            }
        ' 2>/dev/null >| "$tempfile"
        # do our best to avoid clobbering the datafile in a race condition
        if [ $? -ne 0 -a -f "$datafile" ]; then
            env rm -f "$tempfile"
        else
            [ "$_Z_OWNER" ] && chown $_Z_OWNER:$(id -ng $_Z_OWNER) "$tempfile"
            env mv -f "$tempfile" "$datafile" || env rm -f "$tempfile"
        fi

    # tab completion
    elif [ "$1" = "--complete" -a -s "$datafile" ]; then
        while read line; do
            [ -d "${line%%\|*}" ] && echo $line
        done < "$datafile" | awk -v q="$2" -F"|" '
            BEGIN {
                if( q == tolower(q) ) imatch = 1
                q = substr(q, 3)
                gsub(" ", ".*", q)
            }
            {
                if( imatch ) {
                    if( tolower($1) ~ tolower(q) ) print $1
                } else if( $1 ~ q ) print $1
            }
        ' 2>/dev/null

    else
        # list/go
        while [ "$1" ]; do case "$1" in
            --) while [ "$1" ]; do shift; local fnd="$fnd${fnd:+ }$1";done;;
            -*) local opt=${1:1}; while [ "$opt" ]; do case ${opt:0:1} in
                    c) local fnd="^$PWD $fnd";;
                    h) echo "${_Z_CMD:-z} [-chlrtx] args" >&2; return;;
                    x) sed -i -e "\:^${PWD}|.*:d" "$datafile";;
                    l) local list=1;;
                    r) local typ="rank";;
                    t) local typ="recent";;
                esac; opt=${opt:1}; done;;
             *) local fnd="$fnd${fnd:+ }$1";;
        esac; local last=$1; [ "$#" -gt 0 ] && shift; done
        [ "$fnd" -a "$fnd" != "^$PWD " ] || local list=1

        # if we hit enter on a completion just go there
        case "$last" in
            # completions will always start with /
            /*) [ -z "$list" -a -d "$last" ] && cd "$last" && return;;
        esac

        # no file yet
        [ -f "$datafile" ] || return

        local cd
        cd="$(while read line; do
            [ -d "${line%%\|*}" ] && echo $line
        done < "$datafile" | awk -v t="$(date +%s)" -v list="$list" -v typ="$typ" -v q="$fnd" -F"|" '
            function frecent(rank, time) {
                # relate frequency and time
                dx = t - time
                if( dx < 3600 ) return rank * 4
                if( dx < 86400 ) return rank * 2
                if( dx < 604800 ) return rank / 2
                return rank / 4
            }
            function output(files, out, common) {
                # list or return the desired directory
                if( list ) {
                    cmd = "sort -n >&2"
                    for( x in files ) {
                        if( files[x] ) printf "%-10s %s\n", files[x], x | cmd
                    }
                    if( common ) {
                        printf "%-10s %s\n", "common:", common > "/dev/stderr"
                    }
                } else {
                    if( common ) out = common
                    print out
                }
            }
            function common(matches) {
                # find the common root of a list of matches, if it exists
                for( x in matches ) {
                    if( matches[x] && (!short || length(x) < length(short)) ) {
                        short = x
                    }
                }
                if( short == "/" ) return
                # use a copy to escape special characters, as we want to return
                # the original. yeah, this escaping is awful.
                clean_short = short
                gsub(/[\(\)\[\]\|]/, "\\\\&", clean_short)
                for( x in matches ) if( matches[x] && x !~ clean_short ) return
                return short
            }
            BEGIN {
                gsub(" ", ".*", q)
                hi_rank = ihi_rank = -9999999999
            }
            {
                if( typ == "rank" ) {
                    rank = $2
                } else if( typ == "recent" ) {
                    rank = $3 - t
                } else rank = frecent($2, $3)
                if( $1 ~ q ) {
                    matches[$1] = rank
                } else if( tolower($1) ~ tolower(q) ) imatches[$1] = rank
                if( matches[$1] && matches[$1] > hi_rank ) {
                    best_match = $1
                    hi_rank = matches[$1]
                } else if( imatches[$1] && imatches[$1] > ihi_rank ) {
                    ibest_match = $1
                    ihi_rank = imatches[$1]
                }
            }
            END {
                # prefer case sensitive
                if( best_match ) {
                    output(matches, best_match, common(matches))
                } else if( ibest_match ) {
                    output(imatches, ibest_match, common(imatches))
                }
            }
        ')"
        [ $? -gt 0 ] && return
        [ "$cd" ] && cd "$cd"
    fi
}

alias ${_Z_CMD:-z}='_z 2>&1'

[ "$_Z_NO_RESOLVE_SYMLINKS" ] || _Z_RESOLVE_SYMLINKS="-P"

if compctl >/dev/null 2>&1; then
    # zsh
    [ "$_Z_NO_PROMPT_COMMAND" ] || {
        # populate directory list, avoid clobbering any other precmds.
        if [ "$_Z_NO_RESOLVE_SYMLINKS" ]; then
            _z_precmd() {
                _z --add "${PWD:a}"
            }
        else
            _z_precmd() {
                _z --add "${PWD:A}"
            }
        fi
        [[ -n "${precmd_functions[(r)_z_precmd]}" ]] || {
            precmd_functions[$(($#precmd_functions+1))]=_z_precmd
        }
    }
    _z_zsh_tab_completion() {
        # tab completion
        local compl
        read -l compl
        reply=(${(f)"$(_z --complete "$compl")"})
    }
    compctl -U -K _z_zsh_tab_completion _z
elif complete >/dev/null 2>&1; then
    # bash
    # tab completion
    complete -o filenames -C '_z --complete "$COMP_LINE"' ${_Z_CMD:-z}
    [ "$_Z_NO_PROMPT_COMMAND" ] || {
        # populate directory list. avoid clobbering other PROMPT_COMMANDs.
        grep "_z --add" <<< "$PROMPT_COMMAND" >/dev/null || {
            PROMPT_COMMAND="$PROMPT_COMMAND"$'\n''_z --add "$(command pwd '$_Z_RESOLVE_SYMLINKS' 2>/dev/null)" 2>/dev/null;'
        }
    }
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/shimma/.sdkman"
[[ -s "/Users/shimma/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/shimma/.sdkman/bin/sdkman-init.sh"
