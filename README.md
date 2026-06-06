# XV6 Docker Lab Environment

This repository provides a minimal Docker-based environment for building and running the MIT xv6 operating system in a reproducible Linux container.

The project was created as part of my Operating Systems coursework and is intended to demonstrate basic use of Docker for OS-level development experiments.

## What this repository includes

- A Dockerfile based on Ubuntu 16.04
- Required build tools for xv6
- QEMU support for running xv6
- A simple workflow for building and launching xv6 inside a container

## Technologies

- Docker
- Ubuntu 16.04
- GCC multilib
- QEMU
- xv6-public

## Build the Docker image

```bash
docker build -t xv6-lab .
