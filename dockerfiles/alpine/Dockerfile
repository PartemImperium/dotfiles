#Dockerfile
FROM alpine

RUN apk update
RUN apk add curl bash sudo xz musl-locales

# Add the user dockeruser for security reasons and for Nix
RUN adduser --disabled-password --gecos '' dockeruser
RUN echo 'dockeruser:password' | chpasswd
RUN sudo -lU dockeruser

# Nix requires ownership of /nix in single user mode.
RUN mkdir -m 0755 /nix && chown dockeruser /nix

# Change docker user to dockeruser
USER dockeruser

# Set some environment variables for Docker and Nix
ENV USER dockeruser

# Change our working directory to $HOME
WORKDIR /home/dockeruser

ADD install.sh ./
RUN ./install.sh
RUN rm install.sh   

#Docker doesnt seem to like the nix script that adds the nix profile to PATH so call zsh from our local profile
CMD [".nix-profile/bin/zsh"]