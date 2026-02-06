# Password Vault Cloud - Crypto Library (PowerShell)
# Version: 0.1

# TODO: Implement shared crypto functions
# Password Vault Cloud - Crypto Library
# AES-256 + PBKDF2

function New-RandomBytes {
    param([int]$Length)
    $bytes = New-Object byte[] $Length
    [System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($bytes)
    return $bytes
}

function Derive-Key {
    param(
        [string]$MasterPassword,
        [byte[]]$Salt
    )

    $pbkdf2 = New-Object System.Security.Cryptography.Rfc2898DeriveBytes(
        $MasterPassword,
        $Salt,
        100000,   # itérations
        [System.Security.Cryptography.HashAlgorithmName]::SHA256
    )

    return $pbkdf2.GetBytes(32) # clé AES-256
}
