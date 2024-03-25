# Multi-Architecture Docker Images

!!! note "Multi-Architecture Docker Images"
    This guide will show you how to build and push multi-architecture Docker images using GitHub Actions.

Probably that's all you need to setup a multi-arch build for your project.
The following is a sample GitHub workflow file that builds and pushes multi-arch Docker images to GitHub Container Registry (ghcr.io).

```yaml
# Github workflow runner for Docker Multi-Arch using QEMU, Buildx for amd64 & arm64
name: Docker Multi-Arch

on: [ push ]

jobs:
  build:
    runs-on: ubuntu-20.04
    name: build for amd64/arm64
    steps:
      - name: Checkout
        uses: actions/checkout@v3

        # Setup hardware emulator using QEMU
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v2

        # Setup Docker Buildx for multi-arch images
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Login to GitHub Container Registry
        uses: docker/login-action@v2
        with:
          registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.pat }} # GitHub Personal Access Token (PAT)

      - name: Build and push
        uses: docker/build-push-action@v4
        with:
          context: . # use the Dockerfile in the root directory
          platforms: linux/amd64, linux/arm64 # multi-arch build
          push: true # push the image to the registry
          tags: ghcr.io/${{ github.repository }}:${{ github.ref_name }} # tag the image with the branch name
```
