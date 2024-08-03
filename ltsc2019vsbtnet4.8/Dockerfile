# escape=`

FROM ltsc2019vsbuildtools

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Download and install .NET Framework 4.8
RUN curl -SL --output ndp48-x86-x64-allos-enu.exe https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe `
    && start /w ndp48-x86-x64-allos-enu.exe /quiet /norestart `
    && del /q ndp48-x86-x64-allos-enu.exe

# Save this as an image

