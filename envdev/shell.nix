{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
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

  shellHook = ''
    echo "Development environment loaded!"
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
}
