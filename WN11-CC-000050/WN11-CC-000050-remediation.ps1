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
    STIG-ID         : WN11-CC-000050
    Documentation: https://stigaview.com/products/win11/v2r7/WN11-CC-000050/

.TESTED ON
    Date(s) Tested  : 2026-06-04
    Tested By       :  Akshita Shah
    Systems Tested  : Windows 11 Pro (24H2)
    PowerShell Ver. : 5.1, 7.4

.USAGE
    Run this script as Administrator.
    Example syntax:
    PS C:\> .\WN11-CC-000050-remediation.ps1
#>
# Define the Registry path and value details
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths"

$netlogonName = "\\*\NETLOGON"
$sysvolName   = "\\*\SYSVOL"

$desiredValue = "RequireMutualAuthentication=1, RequireIntegrity=1"

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
Write-Host "Starting Remediation for STIG ID: WN11-CC-000050" -ForegroundColor Cyan
Write-Host "Goal: Configure Hardened UNC Paths for NETLOGON and SYSVOL" -ForegroundColor Gray
Write-Host "------------------------------------------------------------" -ForegroundColor Cyan

try {
    # 1. Check if the registry path exists
    if (-not (Test-Path $regPath)) {
        Write-Host "[INFO] Registry path not found. Creating path: $regPath" -ForegroundColor Yellow
        New-Item -Path $regPath -Force | Out-Null
    }

    # 2. Process NETLOGON
    $currentNetlogon = (Get-ItemProperty -Path $regPath -Name $netlogonName -ErrorAction SilentlyContinue).$netlogonName

    if ($currentNetlogon -eq $desiredValue) {
        Write-Host "[OK] NETLOGON setting is already compliant." -ForegroundColor Green
    }
    else {
        Write-Host "[INFO] Configuring NETLOGON Hardened UNC Path." -ForegroundColor Yellow

        New-ItemProperty `
            -Path $regPath `
            -Name $netlogonName `
            -Value $desiredValue `
            -PropertyType String `
            -Force | Out-Null
    }

    # 3. Process SYSVOL
    $currentSysvol = (Get-ItemProperty -Path $regPath -Name $sysvolName -ErrorAction SilentlyContinue).$sysvolName

    if ($currentSysvol -eq $desiredValue) {
        Write-Host "[OK] SYSVOL setting is already compliant." -ForegroundColor Green
    }
    else {
        Write-Host "[INFO] Configuring SYSVOL Hardened UNC Path." -ForegroundColor Yellow

        New-ItemProperty `
            -Path $regPath `
            -Name $sysvolName `
            -Value $desiredValue `
            -PropertyType String `
            -Force | Out-Null
    }

    # 4. Verify
    $verifyNetlogon = (Get-ItemProperty -Path $regPath -Name $netlogonName).$netlogonName
    $verifySysvol   = (Get-ItemProperty -Path $regPath -Name $sysvolName).$sysvolName

    if (($verifyNetlogon -eq $desiredValue) -and ($verifySysvol -eq $desiredValue)) {
        Write-Host "[SUCCESS] Remediation applied successfully." -ForegroundColor Green
    }
    else {
        Write-Host "[ERROR] Failed to verify one or more registry changes." -ForegroundColor Red
    }
}
catch {
    Write-Host "[ERROR] An unexpected error occurred: $_" -ForegroundColor Red
}

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
