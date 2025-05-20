# Cara memakai script
# .\disable-enable-account.ps1 -Username "john" -Action disable
# .\disable-enable-account.ps1 -Username "john" -Action enable

param (
    [string]$Username,
    [ValidateSet("disable", "enable")]
    [string]$Action
)

if (-not $Username -or -not $Action) {
    Write-Host "Usage: .\disable-enable-account.ps1 -Username <username> -Action <disable|enable>"
    exit 1
}

Write-Host "[Windows] Processing user: $Username - Action: $Action"

try {
    if ($Action -eq "disable") {
        Disable-LocalUser -Name $Username
        Write-Host "User '$Username' has been disabled."
    } elseif ($Action -eq "enable") {
        Enable-LocalUser -Name $Username
        Write-Host "User '$Username' has been enabled."
    }
} catch {
    Write-Host "Failed to process user: $($_.Exception.Message)"
}