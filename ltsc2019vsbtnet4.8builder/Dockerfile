# escape=`

FROM ltsc2019vsbtnet4.8chocorustdep

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Install Visual Studio Code Server
RUN powershell -Command "Invoke-WebRequest -Uri https://update.code.visualstudio.com/latest/win32-x64-archive/stable -OutFile vscode-win32-x64-archive.zip; `
    Expand-Archive vscode-win32-x64-archive.zip -DestinationPath C:\vscode; `
    Remove-Item vscode-win32-x64-archive.zip"

# Set the PATH for VS Code Server
RUN setx PATH "%PATH%;C:\vscode\bin"

# Install the C/C++ extension for VS Code
RUN code --install-extension ms-vscode.cpptools

# Install GCC using Chocolatey
RUN choco install -y mingw

# Download and install Visual Studio Build Tools with the necessary components for MSVC
#RUN curl -SL --output vs_buildtools.exe https://aka.ms/vs/16/release/vs_buildtools.exe `
#    && (start /w vs_buildtools.exe --quiet --wait --norestart --nocache `
#        --installPath "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\BuildTools" `
#        --add Microsoft.VisualStudio.Workload.AzureBuildTools `
#        --add Microsoft.VisualStudio.Workload.VCTools `
#        --add Microsoft.Net.ComponentGroup.4.8.DeveloperTools `
#        --add Microsoft.VisualStudio.Component.DockerTools `
#        --add Microsoft.Component.MSBuild `
#        --includeRecommended `
#        --includeOptional `
#        --remove Microsoft.VisualStudio.Component.Windows10SDK.10240 `
#        --remove Microsoft.VisualStudio.Component.Windows10SDK.10586 `
#        --remove Microsoft.VisualStudio.Component.Windows10SDK.14393 `
#        --remove Microsoft.VisualStudio.Component.Windows81SDK `
#        || IF "%ERRORLEVEL%"=="3010" EXIT 0) `
#    && del /q vs_buildtools.exe

# Set the PATH for GCC
RUN setx PATH "%PATH%;%USERPROFILE%\.cargo\bin;C:\ProgramData\chocolatey\bin;C:\ProgramData\chocolatey\lib;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64;C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.16.27023\bin\HostX64\x86;C:\ProgramData\mingw64\mingw64\bin;C:\ProgramData\chocolatey\lib\mingw\tools\install\mingw64\bin"

RUN set PATH="%PATH%;%USERPROFILE%\.cargo\bin;C:\ProgramData\chocolatey\bin;C:\ProgramData\chocolatey\lib;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64;C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.16.27023\bin\HostX64\x86;C:\ProgramData\mingw64\mingw64\bin;C:\ProgramData\chocolatey\lib\mingw\tools\install\mingw64\bin"
