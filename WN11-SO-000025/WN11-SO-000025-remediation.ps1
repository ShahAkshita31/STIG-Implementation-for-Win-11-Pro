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
    STIG-ID         : WN11-SO-000025
    Documentation: https://stigaview.com/products/win11/v2r7/WN11-SO-000025/

.TESTED ON
    Date(s) Tested  : 2026-06-04
    Tested By       :  Akshita Shah
    Systems Tested  : Windows 11 Pro (24H2)
    PowerShell Ver. : 5.1, 7.4

.USAGE
    Run this script as Administrator.
    Example syntax:
    PS C:\> .\WN11-SO-000025-remediation.ps1
#>
# Define the Registry path and value details
$guestAccountName = "Guest"
$newGuestName = "Guest_Disabled"

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
Write-Host "Starting Remediation for STIG ID: WN11-SO-000025" -ForegroundColor Cyan
Write-Host "Goal: Rename Built-in Guest Account" -ForegroundColor Gray
Write-Host "------------------------------------------------------------" -ForegroundColor Cyan

try {
    # Find the built-in Guest account using its SID ending in -501
    $guestAccount = Get-LocalUser | Where-Object {
        $_.SID.Value -match "-501$"
    }

    if (-not $guestAccount) {
        Write-Host "[ERROR] Built-in Guest account not found." -ForegroundColor Red
        exit
    }

    $currentName = $guestAccount.Name

    if ($currentName -ne $guestAccountName) {
        Write-Host "[OK] Guest account is already renamed to '$currentName'." -ForegroundColor Green
    }
    else {
        Write-Host "[INFO] Renaming Guest account to '$newGuestName'." -ForegroundColor Yellow

        Rename-LocalUser -Name $currentName -NewName $newGuestName -ErrorAction Stop

        $verifyAccount = Get-LocalUser -Name $newGuestName -ErrorAction SilentlyContinue

        if ($verifyAccount) {
            Write-Host "[SUCCESS] Guest account renamed successfully." -ForegroundColor Green
        }
        else {
            Write-Host "[ERROR] Failed to verify account rename." -ForegroundColor Red
        }
    }
}
catch {
    Write-Host "[ERROR] An unexpected error occurred: $_" -ForegroundColor Red
}

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
