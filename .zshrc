zmodload zsh/complist
. ~/.config/async.zsh
async_init

autoload -Uz compinit
compinit -C
setopt menucomplete
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' squeeze-slashes true
setopt LIST_PACKED
setopt inc_append_history
setopt hist_reduce_blanks
setopt share_history
setopt auto_list
#setopt always_to_end
setopt auto_menu

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep
unsetopt nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/danny/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/danny/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/danny/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/danny/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

async_start_worker zshrc -n
callback(){
	eval "$3"
	async_stop_worker zshrc
	async_unregister_callback zshrc
}
async_register_callback zshrc callback
async_job zshrc '/home/danny/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null

lowp(){
	sudo ryzenadj -a 15000 -b 30000 -c 20000 --power-saving
	echo
}
highp(){
	sudo ryzenadj -a 35000 -b 50000 -c 40000 --max-performance
	echo
}
export VISUAL="nano"
export EDITOR="$VISUAL"
export PATH="/home/danny/.bin:$PATH"
PS1='%# '
function set-title-precmd() {
  printf "\e]2;%s\a" "${PWD/#$HOME/~}"
}

function set-title-preexec() {
  printf "\e]2;%s\a" "$1"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-preexec

function iplot {
    cat <<EOF | gnuplot
    set terminal pngcairo enhanced font 'Fira Sans,10'
    set autoscale
    set samples 1000
    set output '|kitty +kitten icat --stdin yes'
    set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#fdf6e3" behind
    plot $@
    set output '/dev/null'
EOF
}

cd ~
