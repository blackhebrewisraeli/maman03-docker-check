# xv6 Docker Environment — Maman 03

![Docker Build](https://github.com/blackhebrewisraeli/maman03-docker-check/actions/workflows/docker-build.yml/badge.svg)

This repository provides a clean Docker-based environment for building and running the MIT xv6 operating system.

The repository was prepared as part of Operating Systems coursework and is focused on reproducible Docker validation for xv6. It documents the environment setup only and does not publish course solution files.

## Purpose

This repository demonstrates:

- Building an Ubuntu-based Docker image
- Installing the required xv6 build dependencies
- Cloning the public MIT xv6 source tree
- Building and running xv6 with QEMU
- Running a basic automated validation script
- Validating the Docker image through GitHub Actions

## Repository Structure

```text
.
├── Dockerfile
├── README.md
├── .gitignore
├── docs/
│   └── docker-validation.md
├── scripts/
│   ├── check-docker-build.sh
│   └── run-xv6.sh
└── .github/
    └── workflows/
        └── docker-build.yml
```

## Build the Docker Image

From the repository root:

```bash
docker build --platform linux/amd64 -t xv6-maman03 .
```

## Start an Interactive Container

```bash
docker run --rm -it --platform linux/amd64 xv6-maman03
```

The container starts in:

```bash
/xv6
```

## Build xv6

Inside the container:

```bash
make
```

## Run xv6

Inside the container:

```bash
make qemu-nox
```

To exit QEMU:

```text
Ctrl+A, then X
```

## Automated Validation

From the repository root:

```bash
./scripts/check-docker-build.sh
```

The script builds the Docker image and checks that the xv6 source directory and Makefile exist inside the container.

## Scope

This repository is intentionally limited to the Docker environment and validation process.

It does not include:

- Course assignment solution files
- Private university-provided materials
- Submitted documents
- Screenshots or personal identifiers
- Modified xv6 source files

## Notes

The xv6 source code is cloned from the public MIT xv6 repository during image build. QEMU is used to run xv6 as a guest operating system inside the container.
