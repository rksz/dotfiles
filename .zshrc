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
case ${UID} in
0)
    PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
*)

DEFAULT=$'%{\e[1;0m%}'
RESET="%{${reset_color}%}"
GREEN="%{${fg[green]}%}"
BLUE="%{${fg[blue]}%}"
RED="%{${fg[red]}%}"
CYAN="%{${fg[cyan]}%}"
WHITE="%{${fg[white]}%}"

setopt prompt_subst
# PROMPT='${RESET}${GREEN}${WINDOW:+"[$WINDOW]"}${RESET}%{$fg_bold[blue]%}${USER}@%m ${RESET}${WHITE}$ ${RESET}'
# PROMPT='${RESET}${GREEN}${WINDOW:+"[$WINDOW]"}${RESET}%{$fg_bold[blue]%}${USER}@%m ${RESET}${WHITE}$ ${RESET}'


# PROMPT="${RESET}${BLUE}[%D{%T}][%n@%m %~]${RESET}${WHITE}$ ${RESET}"
PROMPT="${RESET}${BLUE}[%D{%T}][%n@%m %(5~,../%2~,%~)% ]${RESET}${WHITE}$ ${RESET}"


# RPROMPT='${RESET}${WHITE}[${BLUE}%(5~,%-2~/.../%2~,%~)% ${WHITE}]${WINDOW:+"[$WINDOW]"} ${RESET}'

# Show git branch when you are in git repository http://d.hatena.ne.jp/mollifier/20100906/p1
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"    
  zstyle ':vcs_info:git:*' unstagedstr "-"  
  zstyle ':vcs_info:git:*' formats '(%s)-[%c%u%b]'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%c%u%b|%a]'
fi

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[2]=$(_git_not_pushed)
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg

function _git_not_pushed()
{
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
    head="$(git rev-parse HEAD)"
    for x in $(git rev-parse --remotes)
    do
      if [ "$head" = "$x" ]; then
        return 0
      fi
    done
    echo "{?}"
  fi
  return 0
}

# RPROMPT="%1(v|%F${CYAN}%1v%2v%f|)${vcs_info_git_pushed}${RESET}${WHITE}[${BLUE}%(5~,%-2~/.../%2~,%~)% ${WHITE}]${WINDOW:+"[$WINDOW]"} ${RESET}"

    ;;
esac

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

#============================================================ 
# Zshrc setopt
#============================================================ 
setopt auto_cd              # 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_pushd           # cd でTabを押すとdir list を表示
setopt pushd_ignore_dups    # ディレクトリスタックに同じディレクトリを追加しないようになる
setopt correct              # コマンドのスペルチェックをする
setopt correct_all          # コマンドライン全てのスペルチェックをする
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
compinit


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

unset LSCOLORS

case "${TERM}" in
xterm)
    export TERM=xterm-color

    ;;
kterm)
    export TERM=kterm-color

    stty erase
    ;;

cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad

    export LS_COLORS='di=01;32:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30'
    zstyle ':completion:*' list-colors \
        'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;

kterm*|xterm*)
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    zstyle ':completion:*' list-colors \
        'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;

dumb)
    echo "Welcome Emacs Shell"
    ;;
esac


#============================================================ 
# PATH Settings
#============================================================ 
export PATH=${HOME}/dotfiles/bin:$PATH

# import z
. ${HOME}/dotfiles/bin/z.sh
