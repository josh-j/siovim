{
  description = "siovim";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixvim.url = "github:nix-community/nixvim/main";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    nixvim,
    nixpkgs,
    nixpkgs-stable,
    flake-parts,
    ...
  } @ inputs: let
    mkPkgs = system:
      import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    mkStablePkgs = system:
      import nixpkgs-stable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      imports = [
        inputs.flake-parts.flakeModules.easyOverlay
      ];

      perSystem = {
        system,
        config,
        ...
      }: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        pkgs = mkPkgs system;
        stablePkgs = mkStablePkgs system;
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs =
            {
              inherit inputs system stablePkgs;
            }
            // import ./lib {inherit pkgs;};
        };
        siovim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages = {
          inherit siovim;
          default = siovim;
        };

        overlayAttrs = {
          inherit (config.packages) siovim;
        };
      };
    };
}
