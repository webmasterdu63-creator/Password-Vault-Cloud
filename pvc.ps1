# Password Vault Cloud - CLI (PowerShell)
# Version: 0.1

# TODO: Implement CLI commands
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("generate","encrypt","decrypt")]
    [string]$Command,
    [string]$MasterPassword,
    [string]$Input,
    [string]$Output,
    [int]$Length = 16
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

switch ($Command) {
    "generate" {
        & "$scriptDir/../generator/password_generator.ps1" -Length $Length -Upper -Lower -Digits -Symbols
    }

    "encrypt" {
        if (-not $MasterPassword -or -not $Input -or -not $Output) {
            Write-Error "Usage: pvc.ps1 encrypt -MasterPassword <pwd> -Input <file> -Output <file>"
            exit 1
        }
        & "$scriptDir/../encryption/encrypt.ps1" -MasterPassword $MasterPassword -InputFile $Input -OutputFile $Output
    }

    "decrypt" {
        if (-not $MasterPassword -or -not $Input -or -not $Output) {
            Write-Error "Usage: pvc.ps1 decrypt -MasterPassword <pwd> -Input <file> -Output <file>"
            exit 1
        }
        & "$scriptDir/../encryption/decrypt.ps1" -MasterPassword $MasterPassword -InputFile $Input -OutputFile $Output
    }
}
