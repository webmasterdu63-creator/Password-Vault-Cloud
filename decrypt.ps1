# Password Vault Cloud - AES Decryption (PowerShell)
# Version: 0.1

# TODO: Implement AES-256 decryption
# Password Vault Cloud - AES Decryption

param(
    [string]$MasterPassword,
    [string]$InputFile,
    [string]$OutputFile
)

. "$PSScriptRoot/crypto_lib.ps1"

$bytes = [System.IO.File]::ReadAllBytes($InputFile)

# Extraction des blocs
$salt = $bytes[0..15]
$iv   = $bytes[16..31]
$data = $bytes[32..($bytes.Length - 1)]

# Dérivation de la clé
$key = Derive-Key -MasterPassword $MasterPassword -Salt $salt

# Configuration AES
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.KeySize = 256
$aes.BlockSize = 128
$aes.Mode = "CBC"
$aes.Padding = "PKCS7"
$aes.Key = $key
$aes.IV = $iv

$decryptor = $aes.CreateDecryptor()
$decrypted = $decryptor.TransformFinalBlock($data, 0, $data.Length)

[System.IO.File]::WriteAllBytes($OutputFile, $decrypted)

Write-Output "Fichier déchiffré : $OutputFile"
