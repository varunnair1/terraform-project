if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script must be run as Administrator. Right-click PowerShell and select 'Run as Administrator'."
    exit
}

Write-Host "Installing basic IIS features and Management Console..."

Enable-WindowsOptionalFeature -Online -FeatureName "IIS-WebServerRole" -All
Enable-WindowsOptionalFeature -Online -FeatureName "IIS-ManagementConsole" -All

if ($?) {
    Write-Host "IIS installation initiated successfully. The process may take a few moments."
    Write-Host "You can verify the installation by navigating to http://localhost in your web browser after the process is complete."
} else {
    Write-Error "An error occurred during the IIS installation process."
}
