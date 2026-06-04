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
    STIG-ID         : WN11-SO-000070
    Documentation: https://stigaview.com/products/win11/v2r7/WN11-SO-000070/

.TESTED ON
    Date(s) Tested  : 2026-06-04
    Tested By       :  Akshita Shah
    Systems Tested  : Windows 11 Pro (24H2)
    PowerShell Ver. : 5.1, 7.4

.USAGE
    Run this script as Administrator.
    Example syntax:
    PS C:\> .\WN11-SO-000070-remediation.ps1
#>
# Define the Registry path and value details
$approvedAdmins = @(
    "Administrator",
    "ITAdmin",
    "Domain Admins"
)

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
Write-Host "Starting Remediation for STIG ID: WN11-SO-000070" -ForegroundColor Cyan
Write-Host "Goal: Remove Unauthorized Accounts from Local Administrators Group" -ForegroundColor Gray
Write-Host "------------------------------------------------------------" -ForegroundColor Cyan

try {
    # Get current Administrators group members
    $admins = Get-LocalGroupMember -Group "Administrators" -ErrorAction Stop

    foreach ($member in $admins) {

        $accountName = $member.Name.Split('\')[-1]

        if ($approvedAdmins -contains $accountName) {
            Write-Host "[OK] Approved administrator account: $($member.Name)" -ForegroundColor Green
        }
        else {
            Write-Host "[INFO] Removing unauthorized administrator: $($member.Name)" -ForegroundColor Yellow

            try {
                Remove-LocalGroupMember `
                    -Group "Administrators" `
                    -Member $member.Name `
                    -ErrorAction Stop

                Write-Host "[SUCCESS] Removed $($member.Name)" -ForegroundColor Green
            }
            catch {
                Write-Host "[ERROR] Failed to remove $($member.Name): $_" -ForegroundColor Red
            }
        }
    }

    Write-Host "[SUCCESS] Remediation completed." -ForegroundColor Green
}
catch {
    Write-Host "[ERROR] An unexpected error occurred: $_" -ForegroundColor Red
}

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
