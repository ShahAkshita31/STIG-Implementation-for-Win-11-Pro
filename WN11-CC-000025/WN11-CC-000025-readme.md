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

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
Write-Host "Starting Remediation for STIG ID: WN11-CC-000025" -ForegroundColor Cyan
Write-Host "Goal: Disable IP Source Routing (Prevent Packet Spoofing)" -ForegroundColor Gray
Write-Host "------------------------------------------------------------" -ForegroundColor Cyan

try {

    # Check whether registry path exists
    if (-not (Test-Path $regPath)) {
        Write-Host "[INFO] Registry path not found. Creating path: $regPath" -ForegroundColor Yellow
        New-Item -Path $regPath -Force | Out-Null
    }

    # Read current value
    $currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName

    # Check compliance
    if ($currentValue -eq $desiredValue) {
        Write-Host "[OK] System is already compliant. '$regName' is set to $desiredValue." -ForegroundColor Green
    }
    else {

        # Apply remediation
        Write-Host "[INFO] Remediating... Setting '$regName' to $desiredValue." -ForegroundColor Yellow

        New-ItemProperty `
            -Path $regPath `
            -Name $regName `
            -Value $desiredValue `
            -PropertyType DWord `
            -Force `
            -ErrorAction Stop | Out-Null

        # Verify remediation
        $newValue = (Get-ItemProperty -Path $regPath -Name $regName).$regName

        if ($newValue -eq $desiredValue) {
            Write-Host "[SUCCESS] Remediation applied successfully." -ForegroundColor Green
        }
        else {
            Write-Host "[ERROR] Failed to verify registry change." -ForegroundColor Red
        }
    }
}
catch {
    Write-Host "[ERROR] An unexpected error occurred: $_" -ForegroundColor Red
}

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
<img width="912" height="1859" alt="image" src="https://github.com/user-attachments/assets/3a5b058c-e969-41df-8044-1b7fa846c627" />

