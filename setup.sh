cd ~

arrow_prefix=">>>>>>>>"

function blue {
    echo -e "$(tput setaf 4)" "$1" "$(tput sgr0)"
}

function red {
    echo -e "$(tput setaf 1)" "$1" "$(tput sgr0)"
}

function yellow {
    echo -e "$(tput setaf 3)" "$1" "$(tput sgr0)"
}

# ----- PARU -----
if ! pacman -Qs paru> /dev/null ; then
    print "Installing paru aur helper."
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/paru-bin.git
    cd paru-bin
    makepkg -si
    cd ..
    rm -rf paru-bin
fi

# ----- Packages -----
install_type=""
packages_to_install=""

yellow "\n${arrow_prefix} We need to install some packages \n(Hint: Select 1)\n"

select poption in "dots related only" "all other not related to dots packages and bloatware"
do
    case $poption in
        "dots related only")
            install_type="minimal"
            packages_to_install="neovim feh fish picom alacritty bat tmux fd lsd nemo brightnessctl git-delta network-manager-applet flameshot xsel stow ttf-noto-nerd ttf-firacode-nerd awesome-git lxsession lxappearance alsa-utils alsa-plugins ripgrep rofi redshift nitrogen brave-bin betterlockscreen libpulse"
            break
        ;;
        "all other not related to dots packages and bloatware")
            install_type="full"
            packages_to_install="neovim playerctl xfce4-clipman-plugin feh fish picom alacritty bat tmux fd lsd rustup visual-studio-code-bin brave-bin nemo docker brightnessctl network-manager-applet volctl flameshot xsel stow obsidian obs-studio ttf-noto-nerd ttf-firacode-nerd awesome-git rtx lxsession lxappearance alsa-utils alsa-plugins arc xarchiver arc-icon-theme ripgrep pnpm stacer-bin rofi materia-gtk-theme discord android-studio android-sdk android-file-transfer gvfs-mtp unityhub android-udev dotnet-runtime dotnet-sdk mono-msbuild mono-msbuild-sdkresolver mono neofetch font-manager cava xclip yad dpkg wezterm luarocks redshift nitrogen betterlockscreen xmousepasteblock"
            break
        ;;
        *)
            red "\nInvalid Option\n"
        ;;
    esac
done


yellow "\n${arrow_prefix} These packages are going to be installed"
blue "\n$packages_to_install"

yellow "\n${arrow_prefix} Installing packages"
paru -S $packages_to_install

# ----- Configs -----
yellow "\n${arrow_prefix} Setting up configs"
git clone https://github.com/coderosh/.dots .dots
cd .dots
stow */
bat cache --build

# ----- Fish plugins -----
yellow "\n${arrow_prefix} Installing fish plugins"
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
fish -c "fisher update"
fish -c "fish_update_completions"
chsh -s $(which fish)

#---- Betterlockscreen ----
betterlockscreen -u .dots/.wallpapers/ --fx

if [ $install_type == "minimal" ]; then
    echo "minimal"
    exit
fi

# ----- Rust -----
rustup default stable

# ----- node, bun -----
curl https://mise.run | sh
~/.local/bin/mise use --global node@lts
~/.local/bin/mise use --global node@lts

# ----- Docker -----
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

