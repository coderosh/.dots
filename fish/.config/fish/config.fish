if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias v=nvim
alias sv="sudo nvim"
alias vi=nvim
alias vic="nvim --clean"

alias ls=lsd
alias lsa="lsd -a"
alias yay=paru

alias gs="git status"
alias gd="git diff"
alias gss="git status -s"

alias cmatrix="unimatrix -s 96"

fish_add_path -g ~/.dots/.bin
fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/.local/bin
fish_add_path ~/.spicetify

rtx activate fish | source


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f ~/miniconda3/bin/conda
    eval ~/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

