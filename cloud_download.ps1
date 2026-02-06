param(
    [string]$TokenFile,
    [string]$RemoteName = "vault.enc",
    [string]$LocalFile = "./vault.enc"
)

if (-not (Test-Path $TokenFile)) {
    Write-Error "Token OAuth OneDrive introuvable."
    exit 1
}

$token = Get-Content $TokenFile -Raw | ConvertFrom-Json
$accessToken = $token.access_token

$downloadUrl = "https://graph.microsoft.com/v1.0/me/drive/root:/$RemoteName:/content"

Invoke-RestMethod -Uri $downloadUrl -Headers @{Authorization = "Bearer $accessToken"} -OutFile $LocalFile

Write-Output "Téléchargement terminé depuis OneDrive : $LocalFile"
