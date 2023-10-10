# Copyright 2023 SECO Mind Srl
# SPDX-License-Identifier: Apache-2.0

{ rust-codegen, stdenvNoCC, protoSrc, protobuf }:
stdenvNoCC.mkDerivation {
  name = "rust-edgehog-device-forwarder-proto";
  nativeBuildInputs = [ protobuf ];
  src = protoSrc;
  buildPhase = ''
    mkdir -p $out
    ${rust-codegen}/bin/rust-codegen -w . -o $out/
  '';
}
