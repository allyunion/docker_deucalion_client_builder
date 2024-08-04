# escape=`

FROM ltsc2019vsbuildtools AS installer

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Download and install .NET Framework 4.8
#RUN curl -SL --output ndp48-x86-x64-allos-enu.exe https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe `
#    && start /w ndp48-x86-x64-allos-enu.exe /quiet /norestart `
#    && del /q ndp48-x86-x64-allos-enu.exe

# Copy the PowerShell script into the container
COPY install-dotnet-4.8.ps1 C:\install-dotnet-4.8.ps1

# Execute the PowerShell script
RUN powershell -NoProfile -ExecutionPolicy Bypass -File C:\install-dotnet-4.8.ps1

# Create a marker file to indicate .NET installation is complete
RUN powershell -Command "New-Item -ItemType File -Force -Path C:\\.net_installed"

# Second stage: Use the intermediate image to continue the build
FROM ltsc2019vsbuildtools

# Copy the marker file from the installer stage
COPY --from=installer C:\\.net_installed C:\\.net_installed

# Check for the marker file and proceed
RUN if not exist C:\\.net_installed exit /b 1

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Remove downloaded file
RUN del /q 'C:\Users\ContainerAdministrator\AppData\Local\Temp\ndp48-x86-x64-allos-enu.exe'

# Download and install Visual Studio Build Tools
RUN curl -SL --output vs_buildtools.exe https://aka.ms/vs/16/release/vs_buildtools.exe `
    && (start /w vs_buildtools.exe --quiet --wait --norestart --nocache `
        --installPath "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\BuildTools" `
        --add Microsoft.VisualStudio.Workload.AzureBuildTools `
        --add Microsoft.VisualStudio.Workload.VCTools `
        --add Microsoft.Net.ComponentGroup.4.8.DeveloperTools `
        --add Microsoft.VisualStudio.Component.DockerTools `
        --add Microsoft.Component.MSBuild `
        --includeRecommended `
        --includeOptional `
        --remove Microsoft.VisualStudio.Component.Windows10SDK.10240 `
        --remove Microsoft.VisualStudio.Component.Windows10SDK.10586 `
        --remove Microsoft.VisualStudio.Component.Windows10SDK.14393 `
        --remove Microsoft.VisualStudio.Component.Windows81SDK `
        || IF "%ERRORLEVEL%"=="3010" EXIT 0) `
    && del /q vs_buildtools.exe

# Save this as an image

