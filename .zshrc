#============================================================ 
# LANG
#============================================================ 
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

#============================================================ 
# Prompt Settings
#============================================================ 
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

#============================================================ 
# Zshrc setopt
#============================================================ 
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


#============================================================ 
# Custom Aliases
#============================================================ 
[ -f ~/dotfiles/.zshrc.alias ] && source ~/dotfiles/.zshrc.alias



[ -f ~/.zshrc.alias.local ] && source ~/.zshrc.alias.local
case "${OSTYPE}" in
darwin*)
    [ -f ~/dotfiles/.zshrc.osx ] && source ~/dotfiles/.zshrc.osx
    ;;
linux*)
    [ -f ~/dotfiles/.zshrc.linux ] && source ~/dotfiles/.zshrc.linux
    ;;
esac


#============================================================ 
# PATH Settings
#============================================================ 
export PATH=${HOME}/dotfiles/bin:$PATH

# import z
. ${HOME}/dotfiles/bin/z.sh

#
#if (which zprof > /dev/null) ;then
#  zprof | less
#fi
