#!/usr/bin/env bash
set -euo pipefail

echo "Building and running xv6..."
make qemu-nox
