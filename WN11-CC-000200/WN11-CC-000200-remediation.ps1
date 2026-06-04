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
    STIG-ID         : WN11-CC-000200
    Documentation: https://stigaview.com/products/win11/v2r7/WN11-CC-000200/

.TESTED ON
    Date(s) Tested  : 2026-06-04
    Tested By       :  Akshita Shah
    Systems Tested  : Windows 11 Pro (24H2)
    PowerShell Ver. : 5.1, 7.4

.USAGE
    Run this script as Administrator.
    Example syntax:
    PS C:\> .\WN11-CC-000200-remediation.ps1
#>
# Define the Registry path and value details
