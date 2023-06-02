if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls="lsd"
alias lsa="lsd -a"
alias v=nvim
alias sv="sudo nvim"
alias code=vscodium
alias gs="git status"

fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/.local/bin

fish_add_path -g ~/.local/share/fnm
eval (fnm env)


fish_add_path -g ~/.local/share/pnpm
# pnpm
set -gx PNPM_HOME "~/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
