FROM archlinux

# Update and install sudo
RUN pacman -Sy --noconfirm sudo

# Create a user with a home directory and add to sudo group
RUN useradd -rm -d /home/user -s /bin/bash -G wheel -u 640 user && \
    echo '%wheel ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to user and set working directory
USER user
WORKDIR /home/user

# Copy dotfiles into container (assuming they are in the same dir as Dockerfile)
COPY --chown=user:user . ./dotfiles
