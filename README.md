# XV6 Docker Lab Environment

This repository provides a minimal Docker-based environment for building and running the MIT xv6 operating system inside a reproducible Linux container.

The project was created as part of Operating Systems coursework and is intended to demonstrate basic Docker usage for OS-level development experiments.

## Overview

The repository contains a Dockerfile that builds an Ubuntu-based environment with the tools required to compile and run xv6 using QEMU.

The image installs only the required build/runtime dependencies, clones the public xv6 source code, and sets `/xv6` as the working directory.

## What this repository includes

- Dockerfile based on Ubuntu 16.04
- Required build tools for xv6
- QEMU support for running xv6
- Simple workflow for building and launching xv6 inside a container

## Technologies

- Docker
- Ubuntu 16.04
- GCC multilib
- Make
- QEMU
- MIT xv6-public

## Build the Docker image

From the repository root:

```bash
docker build -t xv6-lab .
```

## Run the container

```bash
docker run -it --rm xv6-lab
```

You should enter the container in the `/xv6` directory.

## Run xv6 inside the container

Inside the container, run:

```bash
make qemu-nox
```

After xv6 boots successfully, the terminal should show:

```text
xv6...
init: starting sh
$
```

## Run with limited CPU resources

Docker can limit the CPU resources available to the container.

From the host terminal:

```bash
docker run -it --rm --cpus="0.1" xv6-lab
```

Then inside the container:

```bash
make qemu-nox
```

## Exit xv6 and the container

To exit QEMU/xv6:

```text
Ctrl + A, then X
```

Then exit the container:

```bash
exit
```

## Repository purpose

This repository is focused on the Docker environment only.

It does not include assignment solutions, private course files, screenshots, submitted documents, or university-provided material.

## Suggested repository structure

```text
.
├── Dockerfile
├── README.md
├── .gitignore
└── scripts/
    └── run-xv6.sh
```

## Optional helper script

A helper script can be added under `scripts/run-xv6.sh`:

```bash
#!/usr/bin/env bash
set -e

echo "Building and running xv6..."
make qemu-nox
```

Then make it executable:

```bash
chmod +x scripts/run-xv6.sh
```

Inside the container, it can be run with:

```bash
./scripts/run-xv6.sh
```

## Notes

- The xv6 source code is cloned from the public MIT xv6 repository during image build.
- The container shares the Linux kernel of the host environment.
- QEMU is used to run xv6 as a guest operating system inside the container.
- This repository is intended for learning, experimentation, and reproducible setup.
