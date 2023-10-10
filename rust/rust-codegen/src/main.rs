// Copyright 2023 SECO Mind Srl
// SPDX-License-Identifier: Apache-2.0

use clap::Parser;
use color_eyre::eyre::Context;
use std::fs;
use std::path::PathBuf;

#[derive(Parser)]
#[command(version, about)]
struct Cli {
    /// Base path to Protocol Buffer definitions
    #[arg(short, long)]
    working_directory: PathBuf,

    /// Output directory where to store compiled protobuf files
    #[arg(short, long)]
    out: PathBuf,
}

fn main() -> color_eyre::Result<()> {
    let cli = Cli::parse();

    color_eyre::install()?;

    if !cli.out.exists() {
        fs::create_dir_all(&cli.out)
            .wrap_err_with(|| format!("couldn't create directory {}", cli.out.display()))?;
    }

    let wd = cli.working_directory.canonicalize().wrap_err_with(|| {
        format!(
            "couldn't canonicalize working directory {}",
            cli.working_directory.display()
        )
    })?;

    prost_build::Config::new()
        .out_dir(&cli.out)
        .type_attribute(".", "#[derive(Eq)]")
        .compile_protos(
            &[
                wd.join("edgehog/device/forwarder/message.proto"),
                wd.join("edgehog/device/forwarder/http.proto"),
                wd.join("edgehog/device/forwarder/ws.proto"),
            ],
            &[wd],
        )
        .wrap_err("couldn't compile proto")?;

    Ok(())
}
