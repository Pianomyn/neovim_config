sudo apt update
sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev liblzma-dev libffi-dev \
    libsqlite3-dev libbz2-dev libreadline-dev libssl-dev unzip

sudo apt install neovim
sudo apt install bat
sudo apt install nodejs npm
sudo apt install openjdk-17-jdk
sudo apt install lua5.3
sudo apt install golang

curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc

pyenv install 3.9.0
pyenv global 3.9.0
python --version

zsh ../../scripts/install_jdtls.sh

