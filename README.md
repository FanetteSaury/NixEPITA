# College Development Environment with Home Manager

A reproducible development environment using Nix flakes and Home Manager for consistent setup across college computers.

## Quick Start

### Option 1: Home Manager (Recommended - Persistent Environment)
```bash
# Clone and setup
git clone <your-repo-url> ~/dev-env
cd ~/dev-env

# Install persistent user environment
nix run .#homeConfigurations.fanette.activationPackage

# Update configuration later
home-manager switch --flake .#fanette
```

### Option 2: Dev Shell (Temporary Environment)
```bash
cd ~/dev-env
nix develop  # or just 'cd .' if direnv is available
```

## What's Included

### Always Available (Home Manager)
- **Neovim** with LazyVim setup instructions
- **VS Code** for GUI development  
- **Blender** for 3D work
- **Git & Lazygit** with declarative config
- **Development tools**: ripgrep, fd, gcc, nodejs/npm
- **Direnv** for automatic shell activation

### Project-Specific (Dev Shell)
- Same tools available temporarily when needed
- Useful for project-specific versions or tools

## Features

- **Reproducible**: Same environment on any machine with Nix
- **Persistent**: Home Manager tools always available in PATH
- **Automatic**: direnv loads dev shell when you cd into directory
- **Declarative**: All configuration in version control
- **Rollbacks**: Easy to revert environment changes

## LazyVim Setup

```bash
mv ~/.config/nvim ~/.config/nvim.bak  # backup existing config
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim  # will auto-install plugins
```

## Configuration

- Edit `home.nix` to modify your persistent environment
- Edit `shell.nix` for project-specific dev shell tools
- Update email in `home.nix` line 40

## Legacy Support

If flakes aren't supported:
```bash
nix-shell shell.nix
```
