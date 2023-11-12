{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
  { self, nixpkgs, ... } @ inputs:
  let
    inherit (self) outputs;
    util = import ./nix/util.nix {
      inherit inputs outputs;
    };
  in rec {
    packages = util.forEachPkgs (pkgs: {
      default = pkgs.callPackage ./nix/chessSet.nix {
        inherit inputs outputs;
      };
    });
  };
}
