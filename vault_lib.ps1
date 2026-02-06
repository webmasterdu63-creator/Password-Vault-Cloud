# Password Vault Cloud - Vault Library

function Load-Vault {
    param([string]$Path)

    if (-not (Test-Path $Path)) {
        return @{ entries = @() }
    }

    $json = Get-Content $Path -Raw
    return $json | ConvertFrom-Json
}

function Save-Vault {
    param(
        [string]$Path,
        [object]$Vault
    )

    $Vault | ConvertTo-Json -Depth 5 | Set-Content $Path
}

function Add-VaultEntry {
    param(
        [string]$Path,
        [string]$Service,
        [string]$Username,
        [string]$Password
    )

    $vault = Load-Vault -Path $Path

    # Supprimer l’entrée existante si elle existe
    $vault.entries = $vault.entries | Where-Object { $_.service -ne $Service }

    $entry = @{
        service = $Service
        username = $Username
        password = $Password
        updated = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    }

    $vault.entries += $entry
    Save-Vault -Path $Path -Vault $vault
}

function Get-VaultEntry {
    param(
        [string]$Path,
        [string]$Service
    )

    $vault = Load-Vault -Path $Path
    return $vault.entries | Where-Object { $_.service -eq $Service }
}

function List-VaultEntries {
    param([string]$Path)

    $vault = Load-Vault -Path $Path
    return $vault.entries.service
}

function Remove-VaultEntry {
    param(
        [string]$Path,
        [string]$Service
    )

    $vault = Load-Vault -Path $Path
    $vault.entries = $vault.entries | Where-Object { $_.service -ne $Service }
    Save-Vault -Path $Path -Vault $vault
}
