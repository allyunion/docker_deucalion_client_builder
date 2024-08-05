@echo off

:: Build all images in sequential order
docker build -t ltsc2016buildtools .\ltsc2016buildtools || exit /b 1
docker build -t ltsc2016vschocorust .\ltsc2016vschocorust || exit /b 1
docker build -t ltsc2016vschocorustdep -m 8GB .\ltsc2016vschocorustdep || exit /b 1p
docker build -t ltsc2016vsbuilder .\ltsc2016vsbuilder || exit /b 1
docker build -t deucalion_client -m 8GB .\deucalion || exit /b 1
