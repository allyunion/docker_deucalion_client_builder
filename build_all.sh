#!/bin/sh

# Build all images in sequential order
docker build -t ltsc2016buildtools ./ltsc2016buildtools
docker build -t ltsc2016vschocorust ./ltsc2016vschocorust
docker build -t ltsc2016vschocorustdep ./ltsc2016vschocorustdep
docker build -t ltsc2016vsbuilder ./ltsc2016vsbuilder
docker build -t deucalion_client ./deucalion
