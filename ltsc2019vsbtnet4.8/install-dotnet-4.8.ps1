# install-dotnet-4.8.ps1

function Write-Log {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Output "$($timestamp): $($message)"
}

function Ensure-CryptoServices {
    Write-Log "Ensuring Cryptographic Services are running..."
    $cryptoService = Get-Service -Name "CryptSvc" -ErrorAction SilentlyContinue
    if ($null -eq $cryptoService) {
        Write-Log "Cryptographic Services not found."
        exit 1
    }
    if ($cryptoService.Status -ne 'Running') {
        Write-Log "Starting Cryptographic Services..."
        Start-Service -Name "CryptSvc"
        if ($cryptoService.Status -ne 'Running') {
            Write-Log "Failed to start Cryptographic Services."
            exit 1
        }
    }
    Write-Log "Cryptographic Services are running."
}

Write-Log 'Downloading .NET Framework 4.8 offline installer...'
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
$webClient = New-Object System.Net.WebClient
$installerPath = 'C:\Users\ContainerAdministrator\AppData\Local\Temp\ndp48-x86-x64-allos-enu.exe'
try {
    $webClient.DownloadFile('https://go.microsoft.com/fwlink/?linkid=2088631', $installerPath)
    Write-Log 'Download completed successfully.'
} catch {
    Write-Log "Download failed: $_"
    exit 1
}

Ensure-CryptoServices

Write-Log 'Installing .NET Framework 4.8...'
$process = Start-Process -FilePath $installerPath -ArgumentList '/quiet', '/norestart' -Wait -NoNewWindow -PassThru
$exitCode = $process.ExitCode

if ($exitCode -ne 0) {
    Write-Log "Installation failed with exit code $exitCode"
    exit $exitCode
} else {
    Write-Log 'Installation succeeded'
}
