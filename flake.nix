{
  description = "Ready-made templates for easily creating flake-driven environments";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
  in {
    devShells = forEachSupportedSystem ({ pkgs }: {
      default = pkgs.mkShell {
        packages = with pkgs; [ zsh ];
      };
    });
    packages = forEachSupportedSystem ({ pkgs }: rec {
      inherit (pkgs);
    });

    templates = {
      python = {
        path = ./python;
        description = "A simple python project";
      };
    };
  };
}
