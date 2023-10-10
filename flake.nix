# Copyright 2023 SECO Mind Srl
# SPDX-License-Identifier: Apache-2.0

{
  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # rust
    naeresk.url = "github:nix-community/naersk";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, flake-utils, naeresk, rust-overlay }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ rust-overlay.overlays.default ]; };
        rustToolchain = pkgs.rust-bin.stable.latest.default;
        naeresk' = pkgs.callPackage naeresk { cargo = rustToolchain; rustc = rustToolchain; };

        protoSrc = ./proto;
      in
      {
        packages = {
          rustCodeGen = pkgs.callPackage ./.nix/codegen/rust.nix { naereskBuilder = naeresk'.buildPackage; src = ./rust; };
          rust = pkgs.callPackage .nix/rust.nix { inherit protoSrc; rust-codegen = self.packages.${system}.rustCodeGen.unwrapped; };
        };
        formatter = pkgs.nixpkgs-fmt;
      });
}
