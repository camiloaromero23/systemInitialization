printMessage()
{
echo "$(tput setaf 0)$(tput setab 2)$1$(tput sgr 0)"
}

installFonts()
{
    printMessage "Installing Fonts..."
    wget -P ~/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip

    unzip ~/Downloads/JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMono
    rm ~/Downloads/JetBrainsMono.zip
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
}

gnomeTerminalSetup()
{
    printMessage "Setting up gnome-terminal"
    wget -P ~/Downloads https://raw.githubusercontent.com/camiloaromero23/systemInitialization/main/configFiles/gnome_terminal_settings_backup.txt
    dconf dconf load /org/gnome/terminal/ < ~/Downloads/gnome_terminal_settings_backup.txt
    rm ~/Downloads/gnome_terminal_settings_backup.txt
}

installGeneralSoftware()
{
    printMessage "Installing general software..."
    softwareToInstall=( "curl" "git" "neovim" "neofetch" "net-tools" "nmap" "python3" "python3-pip" "unzip" "wget" "zsh")
    for i in "${softwareToInstall[@]}"
    do
        echo "Installing $i"
        sudo apt install -y $i
    done
}

gitSetup()
{
    printMessage "Setting up git..."
    git config --global user.name "Camilo Romero"
    git config --global user.email camiloaromero23@gmail.com
    wget -P ~ https://raw.githubusercontent.com/camiloaromero23/systemInitialization/main/configFiles/.gitignore_global
    git config --global core.excludesfile ~/.gitignore_global
}

installDebPackage()
{
    wget -P ~/Downloads $1
    sudo apt install -y ~/Downloads/$2
    rm ~/Downloads/$2
}

installChrome()
{
    printMessage "Installing Chrome..."
    installDebPackage "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" "google-chrome-stable_current_amd64.deb"
}

installVSCode()
{
    printMessage "Installing VSCode..."
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt install apt-transport-https
    sudo apt update
    sudo apt install code
}

installNodeJS()
{
    printMessage "Installing NodeJS..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
    export NVM_DIR="/home/$USER/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm install lts/erbium
    nvm install --lts
}

installPython()
{
    printMessage "Setting up python..."
    pip3 install pipenv
}

neofetchSetup()
{
    printMessage "Setting up neofetch..."
    mkdir -p ~/.config/neofetch
    wget -P ~/.config/neofetch https://raw.githubusercontent.com/camiloaromero23/systemInitialization/main/configFiles/neofetchConfig.conf
    mv ~/.config/neofetch/neofetchConfig.conf ~/.config/neofetch/config.conf
}

installOhMyZsh()
{    
    printMessage "Setting up OhMyZsh..."
    spd-say 'give me the password'
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    rm ~/.zshrc
    wget -P ~ https://raw.githubusercontent.com/camiloaromero23/systemInitialization/main/configFiles/.zshrc
    wget -P ~ https://raw.githubusercontent.com/camiloaromero23/systemInitialization/main/configFiles/.z.sh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    source ~/.zshrc
}

neovimSetup()
{
    printMessage "Setting up Neovim..."
    mkdir -p ~/.config/nvim
    sudo apt install fzf ripgrep universal-ctags silversearcher-ag fd-find
    npm install -g neovim
    pip3 install neovim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    git clone https://github.com/camiloaromero23/nvim.git ~/.config/nvim
}

# TODO: Fix NodeJS installation on zsh
