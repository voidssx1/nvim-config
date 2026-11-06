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
        # tree-sitter
        tree-sitter

        # C / C++
        gcc
        clang-tools
        cmake
        ninja
        gdb

        # Rust
        rustc
        cargo
        rust-analyzer
        rustfmt
        clippy

        # Go
        go
        gopls
        golangci-lint

        # Python
        python3
        pyright
        ruff

        # Lua
        lua-language-server

        # JavaScript / TypeScript
        nodejs
        typescript-language-server
        prettier
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
