# Copyright 2023 SECO Mind Srl
# SPDX-License-Identifier: Apache-2.0

{ naereskBuilder, src, lib, protobuf, makeWrapper }:
let
  unwrapped =
    naereskBuilder {
      inherit src;
      name = "rust-codegen-unwrapped";
      pname = "rust-codegen";
      cargoBuildOptions = old: old ++ [ "--package=rust-codegen" ];
    };
in
unwrapped.overrideAttrs {
  passthru = { inherit unwrapped; };
  name = "rust-codegen";
  buildInputs = [ makeWrapper ];
  postInstall = ''
    wrapProgram $out/bin/rust-codegen --set PATH ${lib.makeBinPath [protobuf]}
  '';
}
