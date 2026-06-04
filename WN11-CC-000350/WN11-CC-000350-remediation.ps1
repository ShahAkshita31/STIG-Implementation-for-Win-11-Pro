<#
.SYNOPSIS
    This PowerShell script prevents IP source routing by configuring Disable IP Source Routing to the highest protection level.

.NOTES
    Author          : Akshita Shah
    LinkedIn        : linkedin.com/in/akshita-shah-06b924101
    GitHub          : github.com/ShahAkshita31
    Date Created    : 2026-06-04
    Last Modified   : 2026-06-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000350
    Documentation: https://stigaview.com/products/win11/v2r7/WN11-CC-000350/

.TESTED ON
    Date(s) Tested  : 2026-06-04
    Tested By       :  Akshita Shah
    Systems Tested  : Windows 11 Pro (24H2)
    PowerShell Ver. : 5.1, 7.4

.USAGE
    Run this script as Administrator.
    Example syntax:
    PS C:\> .\WN11-CC-000350-remediation.ps1
#>
# Define the Registry path and value details
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"
$regName = "AllowUnencryptedTraffic"
$desiredValue = 0

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
Write-Host "Starting Remediation for STIG ID: WN11-CC-000350" -ForegroundColor Cyan
Write-Host "Goal: Disable Unencrypted WinRM Service Traffic" -ForegroundColor Gray
Write-Host "------------------------------------------------------------" -ForegroundColor Cyan

try {
    # 1. Check if the registry path exists
    if (-not (Test-Path $regPath)) {
        Write-Host "[INFO] Registry path not found. Creating path: $regPath" -ForegroundColor Yellow
        New-Item -Path $regPath -Force | Out-Null
    }

    # 2. Check current value
    $currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName

    if ($currentValue -eq $desiredValue) {
        Write-Host "[OK] System is already compliant. '$regName' is set to $desiredValue." -ForegroundColor Green
    }
    else {
        Write-Host "[INFO] Remediating... Setting '$regName' to $desiredValue." -ForegroundColor Yellow

        if ($null -eq $currentValue) {
            New-ItemProperty `
                -Path $regPath `
                -Name $regName `
                -PropertyType DWord `
                -Value $desiredValue `
                -Force `
                -ErrorAction Stop | Out-Null
        }
        else {
            Set-ItemProperty `
                -Path $regPath `
                -Name $regName `
                -Value $desiredValue `
                -ErrorAction Stop
        }

        # 3. Verify the fix
        $newValue = (Get-ItemProperty -Path $regPath -Name $regName).$regName

        if ($newValue -eq $desiredValue) {
            Write-Host "[SUCCESS] Remediation applied successfully." -ForegroundColor Green
        }
        else {
            Write-Host "[ERROR] Failed to verify the registry change." -ForegroundColor Red
        }
    }
}
catch {
    Write-Host "[ERROR] An unexpected error occurred: $_" -ForegroundColor Red
}

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
