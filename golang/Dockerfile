FROM golang:1.22.5-alpine

RUN apk add --update \
    bash \
    vim \
    git \
    curl \
    wget \
    openssl \
    busybox-extras \
    net-tools \
    iputils \
    bind-tools \
    tcpdump \
    strace \
    gdb \
    traceroute \
    neovim

######## NEO VIM Configuration  ########
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
WORKDIR /root/.config/nvim
COPY ./init.vim .
COPY ./coc-settings.json .
RUN nvim --headless +PlugInstall +qall

######## End of NEO VIM Configuration  ########


ENV GOPATH=/go

RUN mkdir -p /go/bin /go/pkg

WORKDIR /go/src

COPY main.go .

EXPOSE 8080

CMD ["bash"]
