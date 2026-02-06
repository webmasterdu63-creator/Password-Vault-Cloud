# Password Vault Cloud - Password Generator (PowerShell)
# Version: 0.1
# Author: Jean (webmasterdu63-creator)
# TODO: Implement password generation logic
<#
.SYNOPSIS
    Password Vault Cloud - Password Generator (PowerShell)

.DESCRIPTION
    Génère un mot de passe complexe selon les options fournies.

.PARAMETER Length
    Longueur du mot de passe (défaut : 16)

.PARAMETER Upper
    Inclure des lettres majuscules

.PARAMETER Lower
    Inclure des lettres minuscules

.PARAMETER Digits
    Inclure des chiffres

.PARAMETER Symbols
    Inclure des symboles

.EXAMPLE
    ./password_generator.ps1 -Length 20 -Upper -Lower -Digits -Symbols
#>

param(
    [int]$Length = 16,
    [switch]$Upper,
    [switch]$Lower,
    [switch]$Digits,
    [switch]$Symbols
)

# Construction du set de caractères
$chars = ""

if ($Upper)   { $chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ" }
if ($Lower)   { $chars += "abcdefghijklmnopqrstuvwxyz" }
if ($Digits)  { $chars += "0123456789" }
if ($Symbols) { $chars += "!@#$%^&*()-_=+[]{};:,.<>?" }

if ($chars.Length -eq 0) {
    Write-Error "Erreur : aucun type de caractère sélectionné. Utilise -Upper -Lower -Digits -Symbols."
    exit 1
}

# Génération du mot de passe
$password = -join ((1..$Length) | ForEach-Object { $chars[(Get-Random -Max $chars.Length)] })

Write-Output $password
