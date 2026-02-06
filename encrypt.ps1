# Password Vault Cloud - AES Encryption (PowerShell)
# Version: 0.1

# TODO: Implement AES-256 encryption
# Password Vault Cloud - AES Encryption

param(
    [string]$MasterPassword,
    [string]$InputFile,
    [string]$OutputFile
)

. "$PSScriptRoot/crypto_lib.ps1"

# Lecture du fichier source
$data = [System.IO.File]::ReadAllBytes($InputFile)

# Génération du sel + IV
$salt = New-RandomBytes -Length 16
$iv   = New-RandomBytes -Length 16

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

$encryptor = $aes.CreateEncryptor()
$encrypted = $encryptor.TransformFinalBlock($data, 0, $data.Length)

# Format final : SALT + IV + DATA
$final = $salt + $iv + $encrypted
[System.IO.File]::WriteAllBytes($OutputFile, $final)

Write-Output "Fichier chiffré : $OutputFile"
