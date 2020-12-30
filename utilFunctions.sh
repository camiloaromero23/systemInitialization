installGeneralSoftware()
{
    softwareToInstall=( "curl" "git" "neovim" "neofetch" "net-tools" "nmap" "python3" "python3-pip" "wget" "zsh")
    for i in "$softwareToInstall[@]"
    do
        sudo apt install -y $i
    done
}

installDebPackage()
{
    wget -P ~/Downloads $1
    sudo apt install -y ~/Downloads/$2
    rm ~/Downloads/$2
}

installChrome()
{
    installDebPackage "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" "google-chrome-stable_current_amd64.deb"
}

installVSCode()
{
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt install apt-transport-https
    sudo apt update
    sudo apt install code
}

installNodeJS()
{
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | zsh
zsh
nvm install lts/erbium
nvm install --lts
}

installPython()
{
    pip3 install pipenv
}

neofetchSetup()
{
    mkdir -p ~/.config/neofetch
    wget -p ~/.config/neofetch https://raw.githubusercontent.com/camiloaromero23/systemInitialization/main/configFiles/neofetchConfig.conf
    mv neofetchConfig.conf config.conf
}

installOhMyZsh()
{    
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    rm ~/.zshrc
    wget -P ~ https://raw.githubusercontent.com/camiloaromero23/systemInitialization/main/configFiles/.zshrc
    wget -P ~ https://raw.githubusercontent.com/camiloaromero23/systemInitialization/main/configFiles/.z.sh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    source ~/.zshrc
}
