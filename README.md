# Introduction

my dotfiles.

- install.sh: Used to setup and install software on a new mac.
- macos-defaults.sh: Set some default settings. I Like to open System preferneces on my mac when I have a new one to set my defaultes.

## Steps

This steps I use on a new MacBook Pro M1 Developer Machine.

Login with my Apple ID and:

##### Software Update

Open your Mac and run software update

##### Install Xcode and CLT

- Install CLT:

`xcode-select --install `

- Install Xcode from App Store

- when I open Xcode, I was asked to install Rosetta. This is necessary to translate apps built for Intel to run on Apple silicon.

- If you have an Apple Developer account, log in with your Apple ID with Xcode: Preferences -> Accounts tab.

you can set Git username and email using one if this methods:

- Xcode Preferences -> Source Control
- OR syslink .gitconfig from your dotfiles (I do this)
- OR use git commands as in the next step

##### Git

Set Git Username and Email

```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

This will create a git config in your home account: ~/.gitconfig

set up a global git ignore file useing one of this methodes:

- Xcode Preferences -> Source Control (I am not doing this!)
- OR syslink .gitconfig and .gitingnore_global from your dotfiles (I do this)
- OR use Git commands:

```
git config --global core.excludesfile ~/.gitignore_global
```

This will update your ~/.gitconfig to include:

```
[core]
    excludesfile = /Users/YOUR_NAME/.gitignore_global
```

##### Github: Connect with SSH

Login to your github account. Read detailes hier: [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

```
# Gernerate an SSH Key (if you don't have one):
ssh-keygen -t ed25519 -C "you@example.com"

# Adding your SSH key to the ssh-agent
# Start the ssh-agent in the background
eval "$(ssh-agent -s)"


# add this to the ~/.ssh/config file if not exist
# vi ~/.ssh/config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519

# then add your private key to ssh-agent
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# copy your public key
pbcopy < ~/.ssh/id_ed25519.pub

# and login to your github account to add your public key
# Settings -> SSH and GPG keys -> New SSH key or Add SSH key

# test your connection
ssh -T git@github.com
```

### Software

run install.sh or read it and do it step by step like the following:

#### 1. Homebrew

Install [Homebrew](https://brew.sh/) either by runing:
`./install-homebrew.sh`
Or by executing the following command in a terminal:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

You need to run this commands in your Terminal to add Homebrew to your PATH:

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/YOUR_NAME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### 2. Oh-My-Zsh, Plugins, brew and cask

read install.sh for:

- oh-my-zsh,
- plugins,
- brew.sh
- brew-cask.sh
- symlink-setup.sh

### Thanks You:

[A curated list of dotfiles resources.](https://github.com/webpro/awesome-dotfiles)
[Default configuration for Le Wagon's students](https://github.com/lewagon/dotfiles)
[macOS Setup Guide](https://sourabhbajaj.com/mac-setup/)
[Dries Vints](https://github.com/driesvints/dotfiles)
[Paul Irish](https://github.com/paulirish/dotfiles)
[Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
[Paul Miller](https://github.com/paulmillr/dotfiles)
[Lars Kappert](https://www.webpro.nl/articles/getting-started-with-dotfiles)
[Jason Sturges](https://betterprogramming.pub/setting-up-a-macbook-m1-development-machine-cda22a92fa22)
[Richard So](https://codeburst.io/my-ultimate-m1-mac-developer-setup-cfdb2daeed2d)
[Vinicius De Antoni](https://betterprogramming.pub/how-to-set-up-your-macbook-for-web-development-in-2021-a7a1f53f6462)
[Carl Alexander](https://carlalexander.ca/2021-macbook-pro-setup/)
[Dionysia Lemonaki](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/)
