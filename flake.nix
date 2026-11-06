{
  description = "Neovim configuration with complete tooling, language servers, and formatters";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      });
      getTools = pkgs: with pkgs; [
        # Core Neovim tools
        git
        gcc
        tree-sitter
        ripgrep
        fd

        # Runtimes & toolchains
        nodejs
        python3
        uv
        go
        rustc
        cargo

        # Build tools
        cmake
        ninja
        gdb

        # Language servers & linters & formatters
        lua-language-server
        clang-tools
        pyright
        ruff
        gopls
        golangci-lint
        rust-analyzer
        rustfmt
        clippy
        bash-language-server
        vscode-langservers-extracted
        typescript-language-server
        typescript
        prettier
      ] ++ (lib.optionals stdenv.isLinux [
        wl-clipboard
        xclip
      ]);
    in
    {
      packages = forAllSystems ({ pkgs }:
        let
          tools = getTools pkgs;
          neovimWrapped = pkgs.symlinkJoin {
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
          default = neovimWrapped;
          neovim = neovimWrapped;
          tools = pkgs.buildEnv {
            name = "nvim-tools";
            paths = tools;
          };
        }
      );

      apps = forAllSystems ({ pkgs }: {
        default = {
          type = "app";
          program = "${self.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/nvim";
        };
      });

      devShells = forAllSystems ({ pkgs }:
        let
          tools = getTools pkgs;
          nvim = self.packages.${pkgs.stdenv.hostPlatform.system}.default;
        in
        {
          default = pkgs.mkShell {
            name = "nvim-devshell";
            packages = [ nvim ] ++ tools;
          };
        }
      );

      nixosModules.default = { pkgs, ... }: {
        environment.systemPackages = [
          self.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };

      homeManagerModules.default = { pkgs, ... }: {
        home.packages = [
          self.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };

      overlays.default = final: prev: {
        nvim-custom = self.packages.${prev.stdenv.hostPlatform.system}.default;
      };
    };
}
