# escape=`

FROM ltsc2019vsbtnet4.8builder

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Set the working directory
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/allyunion/deucalion.git .

# Use the correct path for Rust tools and GCC, then build the project
RUN setx PATH "%PATH%;%USERPROFILE%\.cargo\bin;C:\ProgramData\chocolatey\bin;C:\ProgramData\chocolatey\lib;C:\ProgramData\mingw64\mingw64\bin;C:\ProgramData\chocolatey\lib\mingw\tools\install\mingw64\bin" && `
    refreshenv && `
    cargo +nightly build --release

# Create bin directory and copy the built executable
RUN powershell -Command "New-Item -ItemType Directory -Force -Path C:\bin; Copy-Item -Path C:\app\target\release\deucalion_client.exe -Destination C:\bin\deucalion_client.exe"

# Define the output directory as a volume to access it from the host
VOLUME C:/bin
