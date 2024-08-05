# escape=`

FROM ltsc2016buildtools

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Download rustup-init.exe and save it in C:\ProgramData\chocolatey\bin
#RUN powershell -Command "Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile C:\ProgramData\chocolatey\bin\rustup-init.exe"
RUN curl -L -o C:\ProgramData\chocolatey\bin\rustup-init.exe https://win.rustup.rs/x86_64
 
# Install Rust via rustup
RUN C:\ProgramData\chocolatey\bin\rustup-init.exe -y --default-toolchain nightly

# Set the PATH for GCC
RUN setx PATH "%PATH%;%USERPROFILE%\.cargo\bin;C:\ProgramData\chocolatey\bin;C:\ProgramData\chocolatey\lib;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64;C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.16.27023\bin\HostX64\x86;C:\ProgramData\mingw64\mingw64\bin;C:\ProgramData\chocolatey\lib\mingw\tools\install\mingw64\bin"

RUN set PATH="%PATH%;%USERPROFILE%\.cargo\bin;C:\ProgramData\chocolatey\bin;C:\ProgramData\chocolatey\lib;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64;C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.16.27023\bin\HostX64\x86;C:\ProgramData\mingw64\mingw64\bin;C:\ProgramData\chocolatey\lib\mingw\tools\install\mingw64\bin"

RUN powershell -NoProfile -ExecutionPolicy Bypass -Command "Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1; refreshenv"
