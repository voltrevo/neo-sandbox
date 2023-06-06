FROM ubuntu:22.04

RUN apt update

RUN apt install -y \
    build-essential \
    curl \
    wget \
    git \
    zsh \
    zip \
    unzip \
    python3

WORKDIR /root/opt

# zsh and oh-my-zsh
RUN \
  chsh -s /bin/zsh && \
  curl -LO https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && \
  chmod +x ./install.sh && \
  ./install.sh && \
  rm ./install.sh && \
  git clone \
    https://github.com/zsh-users/zsh-autosuggestions \
    /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Nodejs, Deno
RUN \
  curl -LO https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-arm64.tar.xz && \
  tar xf node-v18.16.0-linux-arm64.tar.xz && \
  echo 'export PATH="$PATH:$HOME/opt/node-v18.16.0-linux-arm64/bin"' >>zsh-additions && \
  curl -LO https://github.com/LukeChannings/deno-arm64/releases/download/v1.34.1/deno-linux-arm64.zip && \
  unzip deno-linux-arm64.zip && \
  mkdir -p bin && \
  mv deno bin/. && \
  echo 'export PATH="$PATH:$HOME/opt/bin"' >>zsh-additions

# neovim (from source)
RUN \
  apt install -y cmake gettext && \
  git clone https://github.com/neovim/neovim && \
  cd neovim && \
  git checkout v0.9.1 && \
  make CMAKE_BUILD_TYPE=RelWithDebInfo && \
  make install && \
  curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ADD .config /root/.config
ADD .zshrc .gitconfig /root/.

RUN cat zsh-additions >>/root/.zshrc

RUN nvim +PlugInstall +qall

ENV TERM=xterm-256color

WORKDIR /root

CMD zsh
