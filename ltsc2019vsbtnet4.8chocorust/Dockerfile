# escape=`

FROM ltsc2019vsbtnet4.8chocolatey

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Download rustup-init.exe and save it in C:\ProgramData\chocolatey\bin
RUN powershell -Command "Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile C:\ProgramData\chocolatey\bin\rustup-init.exe"

# Install Rust via rustup
RUN C:\ProgramData\chocolatey\bin\rustup-init.exe -y --default-toolchain nightly

# Set the PATH for GCC
RUN setx PATH "%PATH%;%USERPROFILE%\.cargo\bin;C:\ProgramData\chocolatey\bin;C:\ProgramData\chocolatey\lib;C:\ProgramData\mingw64\mingw64\bin;C:\ProgramData\chocolatey\lib\mingw\tools\install\mingw64\bin"

RUN set PATH="%PATH%;%USERPROFILE%\.cargo\bin;C:\ProgramData\chocolatey\bin;C:\ProgramData\chocolatey\lib;C:\ProgramData\mingw64\mingw64\bin;C:\ProgramData\chocolatey\lib\mingw\tools\install\mingw64\bin"

RUN powershell -NoProfile -ExecutionPolicy Bypass -Command \
    "Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1; \
    refreshenv"

# Install git via Chocolatey
RUN choco install -y git

# Create a dummy project to pre-download dependencies
WORKDIR /dummy_project
COPY Cargo.toml .
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN cargo build --release

# Cleanup dummy project
RUN rmdir /s /q src && del Cargo.toml

# Return to root directory
WORKDIR /
