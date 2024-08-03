# escape=`

FROM ltsc2019vsbtnet4.8chocolatey

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Download rustup-init.exe and save it in C:\ProgramData\chocolatey\bin
RUN powershell -Command "Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile C:\ProgramData\chocolatey\bin\rustup-init.exe"

# Install Rust via rustup
RUN C:\ProgramData\chocolatey\bin\rustup-init.exe -y

# Install nightly Rust toolchain and set it as the default
RUN C:\Users\ContainerAdministrator\.cargo\bin\rustup toolchain install nightly && `
    C:\Users\ContainerAdministrator\.cargo\bin\rustup default nightly

# Set the PATH for Rust tools
RUN setx PATH "%PATH%;C:\Users\ContainerAdministrator\.cargo\bin"

# Refresh the environment variables
RUN refreshenv

# Install git via Chocolatey
RUN choco install -y git

