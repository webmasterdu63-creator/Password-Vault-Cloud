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
        & "$scriptDir/../password_generator.ps1" -Length $Length -Upper -Lower -Digits -Symbols
    }

    "encrypt" {
        if (-not $MasterPassword -or -not $Input -or -not $Output) {
            Write-Error "Usage: pvc.ps1 encrypt -MasterPassword <pwd> -Input <file> -Output <file>"
            exit 1
        }
        & "$scriptDir/../encrypt.ps1" -MasterPassword $MasterPassword -InputFile $Input -OutputFile $Output
    }

    "decrypt" {
        if (-not $MasterPassword -or -not $Input -or -not $Output) {
            Write-Error "Usage: pvc.ps1 decrypt -MasterPassword <pwd> -Input <file> -Output <file>"
            exit 1
        }
        & "$scriptDir/../decrypt.ps1" -MasterPassword $MasterPassword -InputFile $Input -OutputFile $Output
    }
}

