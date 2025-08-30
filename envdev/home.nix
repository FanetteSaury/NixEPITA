{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should manage
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Packages that should be available in your user environment
  home.packages = with pkgs; [
    # Core development tools
    neovim
    git
    curl
    
    # Development environment
    vscode
    
    # Creative tools
    blender
    
    # Neovim configuration dependencies  
    nodejs  # Includes npm automatically
    python3
    ripgrep
    fd
    lazygit
    gcc
  ];


  # Bash configuration with custom prompt
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      echo "Home Manager environment loaded!"
      echo "Available tools:"
      echo "  - Neovim" 
      echo "  - VS Code"
      echo "  - Blender" 
      echo "  - Git + Lazygit"
      echo ""
      echo "To setup LazyVim:"
      echo "  1. Backup existing config: mv ~/.config/nvim ~/.config/nvim.bak"
      echo "  2. Clone LazyVim: git clone https://github.com/LazyVim/starter ~/.config/nvim"
      echo "  3. Remove .git folder: rm -rf ~/.config/nvim/.git"
      echo "  4. Start nvim and let it install plugins"
      echo ""
    '';
  };

  # Direnv integration for automatic dev shell loading
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}