<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/PartemImperium/dotfiles">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">dotfiles</h3>

  <p align="center">A single source for all my dotfiles to be applied to my machines.<br /></p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#installed-zsh-modules">Installed zsh Modules</a></li>
        <li><a href="#other-installed-tools">Other installed tools</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#test-it-out">Test it Out</a></li>
    <li><a href="#making-changes">Making Changes</a></li>
    <li><a href="#screenshots">Screenshots</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project
A single source for all my dotfiles to be applied to my machines. These will be applied with [chezmoi](https://github.com/twpayne/chezmoi).


### Built With
* [nix](https://github.com/NixOS/nixpkgs) - package manager
* [home-manager](https://github.com/nix-community/home-manager) - declaritive framework for nix package manager
* [chezmoi](https://github.com/twpayne/chezmoi) - dotfiles manager
* [zsh](https://www.zsh.org/) - my perfered shell
* [zit](https://github.com/thiagokokada/zit) - minimal zsh module manager


### Other installed tools
* [neoFetch](https://github.com/dylanaraps/neofetch) - shows system info with cool ascii art for your distro on login.
* My [aliases](dot_aliases) - my personal aliases for zsh (should work in bash as well)
* My [functions](dot_functions) - my personal functions for zsh. *.zsh gets loaded and compiled.
* [powerline10k](https://github.com/romkatv/powerlevel10k) - zsh theme


### Configurations managed
* .zshrc
* .p10k.zsh
* home.nix
* .gitconfig
  * Creates either a .home.gitconfig or .work.gitconfig file and imports it allowing you to seperate home or work config (and overal config).

## Getting Started

To get a local machine up and running with these dotfiles follow these simple steps.

### Prerequisites

The following things will be needed to use theses dotfiles (any other tools will be installed with nix after installation).
* curl - Used in the oneliner installer.
* bash - Used in the oneliner installer.
* xz - Used in the oneliner installer.
* A installed [nerdfont](https://github.com/ryanoasis/nerd-fonts)
  * I use the patched Hack font but any of the patched fonts from that repo will work.
  * You will need to set it as the font for your terminal emulator.
  * Nix/Home Manager installs Hack NerdFont but currently that doesnt install to host in WSL.
  * If you dont install (or set as the font in your terminal emulator) a patched nerd font things will function but there will be missing chars in the terminal theme making it look weird.

### Installation

This installs [chezmoi](https://github.com/twpayne/chezmoi), [nix](https://github.com/NixOS/nixpkgs) and [home-manager](https://github.com/nix-community/home-manager) and the dotfiles using this repo and applies them to your user.
```zsh
bash <( curl https://raw.githubusercontent.com/PartemImperium/dotfiles/master/install.sh)
```
Note: you can pass a branch into the oneliner installer with the --branch arg. For a normal install I would suggest using master and doing your feature work in a docker container however.
```zsh
bash <( curl https://raw.githubusercontent.com/PartemImperium/dotfiles/master/install.sh) --branch feature/my-super-awesome-feature
```
## Test it Out
If you want to try out before running it on your machine you can use one of the following docker containers to see what it will do. As soon as you exit out of the container it will stop and all changes will be reverted.

You can use whichever base image you perfer (any base image will do but you will need to go through the process of adding a new user because nix cant be installed as root). You first need to build the image then run it. The below commands will build and then start the docker container in a interactive colorized terminal (and auto installs/updates the needed tools) that self destructs when you exit the container.

If you are making changes to the install.sh or build_and_run.sh then you need to replace master with your feature branch in the curl url.

--branch defaults to master and --distro defaults to ubuntu as such if you want master and ubuntu it is not needed to pass either.
### Alpine
```zsh
bash <( curl https://raw.githubusercontent.com/PartemImperium/dotfiles/master/dockerfiles/build_and_run.sh) --branch feature/my-super-cool-feature --distro alpine
```

### Ubuntu
```zsh
bash <( curl https://raw.githubusercontent.com/PartemImperium/dotfiles/master/dockerfiles/build_and_run.sh) --branch feature/my-super-cool-feature --distro ubuntu
```

## Making Changes
To make changes I make the changes in a new branch and then run them in a docker container as explained in [Test it Out](#test-it-out). If you dont want to curl the build_and_run.sh script you can just run the version locally and it wil work.

Once I verify everything works in the docker container merge the branch into master and update on machinces.
```zsh
chezmoi update
```

## Screenshots

### macos
![](images/mac-screenshot.png)

### Ubuntu (WSL)
![](images/ubuntu-wsl-screenshot.png)

### Ubuntu Terminal
In the default terminal when only 8 colors exist (and icon fonts wont work) the theme reacts and still shows all the same data (just a little less flashy). The screenshot was taken in a normal terminal emulator specifying it was the default terminal so neoFetch still shows 16 colors.
![](images/ubuntu-terminal-screenshot.png)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* Example chezmoi dotfile repo's
    * [GitHub](https://github.com/topics/chezmoi?o=desc&s=updated)
    * [GitLab](https://gitlab.com/search?search=chezmoi)
* [Good starter readme](https://github.com/othneildrew/Best-README-Template)
* [Helpful guide to get Nix working in docker](https://aaronlevin.ca/post/100703631408/installing-nix-within-a-docker-container)
* [Install script used as a base for installing Nix and chezmoi in a one liner](https://github.com/tapayne88/dotfiles/blob/master/public/install.sh)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/PartemImperium/dotfiles.svg?style=for-the-badge
[contributors-url]: https://github.com/PartemImperium/dotfiles/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/PartemImperium/dotfiles.svg?style=for-the-badge
[forks-url]: https://github.com/PartemImperium/dotfiles/network/members
[stars-shield]: https://img.shields.io/github/stars/PartemImperium/dotfiles.svg?style=for-the-badge
[stars-url]: https://github.com/PartemImperium/dotfiles/stargazers
[issues-shield]: https://img.shields.io/github/issues/PartemImperium/dotfiles.svg?style=for-the-badge
[issues-url]: https://github.com/PartemImperium/dotfiles/issues
