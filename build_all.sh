#!/bin/sh

# Build all images in sequential order
docker build -t ltsc2019vsbuildtools -m 2GB ./ltsc2019vsbuildtools
docker build -t ltsc2019vsbtnet4.8 -m 2GB ./ltsc2019vsbtnet4.8
docker build -t ltsc2019vsbtnet4.8chocolatey -m 2GB  ./ltsc2019vsbtnet4.8chocolatey
docker build -t ltsc2019vsbtnet4.8chocorust -m 2GB ./ltsc2019vsbtnet4.8chocorust
docker build -t ltsc2019vsbtnet4.8builder -m 2GB ./ltsc2019vsbtnet4.8builder
docker build -t deucalion_client -m 2GB ./deucalion
