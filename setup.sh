cd ~

function print {
  echo -e "\n\n" ">>>>>>>> $1" "\n"
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
print "Installing packages"
paru -S neovim fish picom alacritty bat tmux fd lsd rustup visual-studio-code-bin brave-bin nemo docker brightnessctl network-manager-applet volctl flameshot xsel stow obsidian obs-studio ttf-noto-nerd ttf-firacode-nerd awesome-git fnm-bin lxsession lxappearance alsa-utils alsa-plugins arc xarchiver arc-icon-theme ripgrep pnpm stacer-bin rofi materia-gtk-theme discord android-studio android-sdk android-file-transfer gvfs-mtp unityhub android-udev dotnet-runtime dotnet-sdk mono-msbuild mono-msbuild-sdkresolver mono neofetch font-manager cava xclip yad

# ----- Configs -----
print "Setting up configs"
git clone https://github.com/coderosh/.dots .dots
cd .dots
stow */ 
bat cache --build

# ----- Fish plugins -----
print "Installing fish plugins"
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | fisher update"
chsh -s $(which fish)

# ----- Rust -----
rustup default stable

# ----- FNM, bun -----
fnm completions --shell fish 
fnm install --lts
npm install -g bun
fish -c "bun completions"

# ----- Docker -----
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

# ----- Material Icons Fonts -----
mkdir -p ~/.temp-fonts-dir
wget https://raw.githubusercontent.com/google/material-design-icons/master/font/MaterialIcons-Regular.ttf -P ~/.temp-fonts-dir 
wget https://raw.githubusercontent.com/google/material-design-icons/master/font/MaterialIconsRound-Regular.otf -P ~/.temp-fonts-dir 
font-manager -i ~/.temp-fonts-dir/*
rm -rf ~/.temp-fonts-dir








