# Docker Validation

This document records the validation steps for the xv6 Docker environment used in the Maman 03 workflow.

## 1. Build the Docker Image

```bash
docker build --platform linux/amd64 -t xv6-maman03 .
```

Expected result:

```text
Successfully built <image-id>
Successfully tagged xv6-maman03:latest
```

## 2. Start an Interactive Container

```bash
docker run --rm -it --platform linux/amd64 xv6-maman03
```

Inside the container, the working directory should be:

```bash
/xv6
```

## 3. Verify the xv6 Source Tree

Inside the container:

```bash
ls
```

The directory should include core xv6 files such as:

```text
Makefile
proc.c
syscall.c
user.h
```

## 4. Build xv6

Inside the container:

```bash
make
```

The build should finish without fatal errors.

## 5. Run xv6 with QEMU

Inside the container:

```bash
make qemu-nox
```

Expected behavior:

- xv6 boots successfully.
- The console becomes interactive.
- The xv6 shell prompt appears.

To exit QEMU:

```text
Ctrl+A, then X
```

## 6. Run the Automated Validation Script

From the host repository root:

```bash
./scripts/check-docker-build.sh
```

The script validates that the Docker image builds and that the xv6 source tree exists inside the container.

## Notes

This repository validates the Docker environment only. It does not include assignment solution files or submitted documents.
