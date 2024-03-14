if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr -a v nvim
abbr -a sv 'sudo nvim'
abbr -a vi 'nvim'
abbr -a vic 'nvim --clean'

abbr -a ls 'lsd'
abbr -a lsa 'lsd -a'
abbr -a yay 'paru'

abbr -a gs 'git status'
abbr -a gd 'git diff'
abbr -a gss 'git status -s'

abbr -a cmatrix 'unimatrix -s 96'


fish_add_path -g ~/.dots/.bin
fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/.local/bin
fish_add_path -g ~/go/bin
fish_add_path ~/.spicetify

rtx activate fish | source

fish_add_path /home/coderosh/.spicetify
