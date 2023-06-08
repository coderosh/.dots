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
alias code=vscodium

alias gs="git status"
alias gd="git diff"
alias gss="git status -s"

fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/.local/bin

fish_add_path -g ~/.local/share/fnm
eval (fnm env)
