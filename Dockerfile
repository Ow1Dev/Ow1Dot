FROM archlinux:base

RUN useradd -rm -d /home/user -s /bin/bash -u 640 user
USER user
WORKDIR /home/user

COPY . ./dotfiles
