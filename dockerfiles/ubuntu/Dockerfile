 #Dockerfile
FROM ubuntu

# Install packages required to add users and install Nix
RUN apt-get update && apt-get install -y curl bzip2 adduser bash xz-utils sudo

# Add the user dockeruser for security reasons and for Nix
RUN adduser --disabled-password --gecos '' dockeruser
RUN echo 'dockeruser:password' | chpasswd
RUN usermod -aG sudo dockeruser

# Nix requires ownership of /nix in single user mode.
RUN mkdir -m 0755 /nix && chown dockeruser /nix

# Change docker user to dockeruser
USER dockeruser

# Set some environment variables for Docker and Nix
ENV USER dockeruser

# Change our working directory to $HOME
WORKDIR /home/dockeruser

ADD ../../install.sh ./
RUN ./install.sh
RUN rm install.sh   

CMD ["zsh"]