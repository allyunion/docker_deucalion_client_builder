# escape=`

## Stage 1: Install Visual Studio Build Tools and dependencies
#FROM mcr.microsoft.com/windows/servercore:ltsc2019
FROM chocolatey/choco

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Install git
RUN choco install git -y

# Enable TLS 1.2 for the environment
RUN powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1';"
RUN powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1';"
RUN powershell -Command "[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;"

# Install curl
RUN choco install curl -y

## Install Visual Studio Build Tools with necessary components
#RUN choco install visualstudio2019buildtools `
#    --package-parameters `
#        "--add Microsoft.VisualStudio.Workload.AzureBuildTools" `
#        "--add Microsoft.VisualStudio.Workload.VCTools" `
#        "--add Microsoft.Net.ComponentGroup.4.8.DeveloperTools" `
#        "--add Microsoft.VisualStudio.Component.DockerTools" `
#        "--add Microsoft.Component.MSBuild" `
#        "--includeRecommended" `
#        "--includeOptional" `
#    -y

## Install Visual Studio Build Tools with necessary components
#RUN choco install visualstudio2019buildtools `
#    --package-parameters `
#        "--add Microsoft.VisualStudio.Workload.AzureBuildTools" `
#        "--add Microsoft.VisualStudio.Workload.VCTools" `
#        "--add Microsoft.Net.ComponentGroup.4.8.DeveloperTools" `
#        "--add Microsoft.VisualStudio.Component.DockerTools" `
#        "--add Microsoft.Component.MSBuild" `
#        "--includeRecommended" `
#        "--includeOptional" `
#        "--remove Microsoft.VisualStudio.Component.Windows10SDK.10240" `
#        "--remove Microsoft.VisualStudio.Component.Windows10SDK.10586" `
#        "--remove Microsoft.VisualStudio.Component.Windows10SDK.14393" `
#        "--remove Microsoft.VisualStudio.Component.Windows81SDK" `
#    -y

# Download and install Visual Studio Build Tools with the necessary components for MSVC
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

## Download and install Visual Studio Build Tools
#RUN curl -SL --output vs_buildtools.exe https://aka.ms/vs/16/release/vs_buildtools.exe `
#    && (start /w vs_buildtools.exe --quiet --wait --norestart --nocache `
#        --installPath "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\BuildTools" `
#        --add Microsoft.VisualStudio.Workload.AzureBuildTools `
#        --add Microsoft.VisualStudio.Workload.VCTools `
#        --add Microsoft.VisualStudio.Component.DockerTools `
#        --add Microsoft.Component.MSBuild `
#        --remove Microsoft.VisualStudio.Component.Windows10SDK.10240 `
#        --remove Microsoft.VisualStudio.Component.Windows10SDK.10586 `
#        --remove Microsoft.VisualStudio.Component.Windows10SDK.14393 `
#        --remove Microsoft.VisualStudio.Component.Windows81SDK `
#        || IF "%ERRORLEVEL%"=="3010" EXIT 0) `
#    && del /q vs_buildtools.exe

# Install .NET Framework 4.8
RUN choco install dotnetfx -y

# Define the entry point for the docker container.
# This entry point starts the developer command prompt and launches the PowerShell shell.
ENTRYPOINT ["C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\Tools\\VsDevCmd.bat", "-arch=amd64", "&&", "powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]
