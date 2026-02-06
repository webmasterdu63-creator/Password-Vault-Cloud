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

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("generate","encrypt","decrypt","add","list","get","delete")]
    [string]$Command,
    [string]$MasterPassword,
    [string]$Input,
    [string]$Output,
    [string]$Service,
    [string]$Username,
    [string]$Password,
    [int]$Length = 16
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$vaultPath = "$scriptDir/../vault.json"

. "$scriptDir/../vault_lib.ps1"

switch ($Command) {

    "generate" {
        & "$scriptDir/../password_generator.ps1" -Length $Length -Upper -Lower -Digits -Symbols
    }

    "encrypt" {
        & "$scriptDir/../encrypt.ps1" -MasterPassword $MasterPassword -InputFile $Input -OutputFile $Output
    }

    "decrypt" {
        & "$scriptDir/../decrypt.ps1" -MasterPassword $MasterPassword -InputFile $Input -OutputFile $Output
    }

    "add" {
        if (-not $Service -or -not $Username -or -not $Password) {
            Write-Error "Usage: pvc.ps1 add -Service <name> -Username <user> -Password <pwd>"
            exit 1
        }
        Add-VaultEntry -Path $vaultPath -Service $Service -Username $Username -Password $Password
        Write-Output "Entrée ajoutée : $Service"
    }

    "list" {
        List-VaultEntries -Path $vaultPath
    }

    "get" {
        if (-not $Service) {
            Write-Error "Usage: pvc.ps1 get -Service <name>"
            exit 1
        }
        Get-VaultEntry -Path $vaultPath -Service $Service | ConvertTo-Json -Depth 5
    }

    "delete" {
        if (-not $Service) {
            Write-Error "Usage: pvc.ps1 delete -Service <name>"
            exit 1
        }
        Remove-VaultEntry -Path $vaultPath -Service $Service
        Write-Output "Entrée supprimée : $Service"
    }
}
pvc.ps1 sync upload
pvc.ps1 sync download
