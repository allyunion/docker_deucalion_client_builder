# escape=`

FROM ltsc2016vschocorust

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

ENV RUSTC_BOOTSTRAP=1

# Create a dummy project to pre-download dependencies
WORKDIR /dummy_project
COPY Cargo.toml .
RUN mkdir src
COPY main.rs ./src/main.rs
RUN cargo build --release

# Cleanup dummy project
RUN rmdir /s /q src && del Cargo.toml

# Return to root directory
WORKDIR /
