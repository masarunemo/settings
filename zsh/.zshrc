#プロンプト
PROMPT='[%F{magenta}%B%n%b%f@%F{blue}%m%u%f %F{green}%~%f]# '
#RPROMPT='[%F{green}%D %T%f]'

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt autocd extendedglob
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ↑を設定すると、 .. とだけ入力したら1つ上のディレクトリに移動できるので……
# 2つ上、3つ上にも移動できるようにする
alias ...='cd ../..'
alias ....='cd ../../..'

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
setopt hist_ignore_dups
# コマンドがスペースで始まる場合、コマンド履歴に追加しない
# 例： <Space>echo hello と入力
setopt hist_ignore_space

setopt auto_pushd
setopt pushd_ignore_dups

setopt share_history

# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
# 候補を選ぶには <Tab> か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものとする
# こうすると、 Ctrl-W でカーソル前の1単語を削除したとき、 / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

if [ -e /etc/zsh_command_not_found ]; then
	source /etc/zsh_command_not_found
fi

alias la='ls -la'

#==============ここから=================
#入力途中の履歴補完を有効化する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

#入力途中の履歴補完
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
#==============ここまで=================

bindkey "\e[3~" delete-char
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
