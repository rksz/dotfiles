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
# ls
alias -g ls="ls --color"
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
alias 'src'='exec zsh'
alias 'n'="vim -c NERDTreeToggle"
alias 'v'="vim"
alias 'md'='vim ./*.md'
alias 'mmd'='mvim ./*.md'

# vimalias
alias 'evs'='vim ~/.ssh/config'
alias 'evss'='vim ~/.ssh/config.orig'

# grep
alias 'gr'='grep --color=auto -ERUIn'

#make
alias 'm'='make'
alias 'mn'='make native-code'
alias 'mc'='make clean'

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

# git
#alias g='git'
alias gs='git status -sb'
alias gss='git status --porcelain | sed s/^...//'
alias gc='git commit'
alias ga='git add .'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gf='git fetch'
alias gb='git branch -avv'

# dstat
alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-cpu='dstat -Tclr'
alias dstat-net='dstat -Tclnd'
alias dstat-disk='dstat -Tcldr'

# autojump
# alias j='z'

# ssh
alias ssh='env TERM=xterm ssh'
alias ssheuc='env TERM=xterm cocot -t UTF-8 -p EUC-JP ssh '

# taskwarrior
alias t="\task"

# bundler
alias be='bundle exec'

#auto directory jumper
jj () {
  if [ $1 ]; then
      JUMPDIR=$(find . -type d -maxdepth 1 | grep $1 | tail -1)
      if [[ -d $JUMPDIR && -n $JUMPDIR ]]; then
          cd $JUMPDIR
      else
          echo "directory not found"
      fi
  fi
}

alias wk="cd ~/workspace"


# Peco related
alias gsp='git status --porcelain | sed s/^...// | peco | ruby -pe "chomp" | pbcopy'
alias s='ssh $(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|peco|awk "{print \$2}")'
alias j='z'
alias jp='cd $(z | peco | awk "{print \$2}")'
alias c='cd $(ls -F --color=never| grep / | peco)'
alias sshconfig='vagrant ssh-config >>~/.ssh/config'

cleanup () {
    find . -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
    find . -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
}


alias -g V="| vim -"
alias -g O="| xargs open"
alias -g L="| less"
alias -g H="| head"
alias -g Z="| tar -cvzf files_$(date +%Y%m%d%H%M%S).tgz --files-from=-"
alias -g G="| grep"
alias -g S="| sed"
alias -g R="| rsync -av --files-from=- . /tmp/"
alias -g P="| peco | ruby -pe 'chomp' | pbcopy"

agvim () {
  vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

# ------------------------------------------------------------
# Custom Aliases
# ------------------------------------------------------------
case "${OSTYPE}" in
darwin*)
[ -f ~/dotfiles/.zshrc.osx ] && source ~/dotfiles/.zshrc.osx
;;
linux*)
[ -f ~/dotfiles/.zshrc.linux ] && source ~/dotfiles/.zshrc.linux
;;
esac

[ -f ~/.zshrc.alias.local ] && source ~/.zshrc.alias.local


# ------------------------------------------------------------
# Custom App
# ------------------------------------------------------------
export PATH=${HOME}/dotfiles/bin:$PATH
. ${HOME}/dotfiles/bin/z.sh
