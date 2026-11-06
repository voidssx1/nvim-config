{
  description = "Neovim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      tools = with pkgs; [
        tree-sitter
        gcc
        lua-language-server
        clang-tools
        pyright
        ruff
        gopls
        golangci-lint
        rust-analyzer
        rustfmt
        clippy
        typescript-language-server
        prettier
        nodejs
      ];

      nvim = pkgs.symlinkJoin {
        name = "nvim";
        paths = [ pkgs.neovim ];
        buildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/nvim \
            --prefix PATH : ${pkgs.lib.makeBinPath tools}
        '';
      };
    in
    {
      packages.${system}.default = nvim;
      devShells.${system}.default = pkgs.mkShell {
        packages = [ nvim ];
      };
    };
}
