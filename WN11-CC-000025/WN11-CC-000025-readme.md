<#
.SYNOPSIS
    This PowerShell script prevents IP source routing by configuring Disable IP Source Routing to the highest protection level.

.NOTES
    Author          : Akshita Shah
    LinkedIn        : linkedin.com/in/akshita-shah-06b924101
    GitHub          : github.com/ShahAkshita31
    Date Created    : 2026-06-03
    Last Modified   : 2026-06-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000025
    Documentation: https://stigaview.com/products/win11/v2r7/WN11-CC-000025/

.TESTED ON
    Date(s) Tested  : 2026-06-03
    Tested By       :  Akshita Shah
    Systems Tested  : Windows 11 Pro (24H2)
    PowerShell Ver. : 5.1, 7.4

.USAGE
    Run this script as Administrator.
    Example syntax:
    PS C:\> .\remediate_WN11-CC-000025.ps1 
#>

# Define registry settings
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
$regName = "DisableIPSourceRouting"
$desiredValue = 2

Write-Host "Starting Remediation for STIG ID: WN11-CC-000025"

try {
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    $currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName

    if ($currentValue -ne $desiredValue) {
        New-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -PropertyType DWord -Force | Out-Null
        Write-Host "Remediated successfully"
    }
    else {
        Write-Host "Already compliant"
    }
}
catch {
    Write-Host "Error: $_"
}

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan

