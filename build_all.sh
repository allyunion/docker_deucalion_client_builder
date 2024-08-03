#!/bin/sh

# Build all images in sequential order
docker build -t ltsc2019vsbuildtools ./ltsc2019vsbuildtools
docker build -t ltsc2019vsbtnet4.8 ./ltsc2019vsbtnet4.8
docker build -t ltsc2019vsbtnet4.8chocolatey  ./ltsc2019vsbtnet4.8chocolatey
docker build -t ltsc2019vsbtnet4.8chocorust ./ltsc2019vsbtnet4.8chocorust
docker build -t ltsc2019vsbtnet4.8chocorustdep ./ltsc2019vsbtnet4.8chocorustdep
docker build -t ltsc2019vsbtnet4.8builder ./ltsc2019vsbtnet4.8builder
docker build -t deucalion_client ./deucalion
