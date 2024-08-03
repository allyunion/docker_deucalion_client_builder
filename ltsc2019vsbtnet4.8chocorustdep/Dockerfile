# escape=`

FROM ltsc2019vsbtnet4.8chocorust

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Create a dummy project to pre-download dependencies
WORKDIR /dummy_project
COPY Cargo.toml .
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN cargo build --release

# Cleanup dummy project
RUN rmdir /s /q src && del Cargo.toml

# Return to root directory
WORKDIR /
