if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind \cf . tsessionizer


abbr -a v 'nvim .'
abbr -a sv 'sudo nvim'
abbr -a vi 'nvim'
abbr -a vic 'nvim --clean'

abbr -a ls 'lsd'
abbr -a lsa 'lsd -a'
abbr -a la 'lsd -al'
abbr -a yay 'paru'

abbr -a gs 'git status'
abbr -a gd 'git diff'
abbr -a gss 'git status -s'
abbr -a gc 'git commit -m'
abbr -a gca 'git commit -am'

abbr -a cmatrix 'unimatrix -s 96'

abbr -a neofetch 'fastfetch'


abbr -a cat 'bat'
abbr -a catc 'bat --pager=never -A'


fish_add_path -g ~/.dots/.bin
fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/.local/bin
fish_add_path -g ~/go/bin
fish_add_path ~/.spicetify

fish_config theme choose "catppuccin_mocha"

fish_add_path /home/coderosh/.spicetify
~/.local/bin/mise activate fish | source
