param(
    [string]$TokenFile,
    [string]$RemoteName = "/vault.enc",
    [string]$LocalFile = "./vault.enc"
)

if (-not (Test-Path $TokenFile)) {
    Write-Error "Token OAuth Dropbox introuvable."
    exit 1
}

$token = Get-Content $TokenFile -Raw | ConvertFrom-Json
$accessToken = $token.access_token

$headers = @{
    Authorization = "Bearer $accessToken"
    "Dropbox-API-Arg" = "{`"path`": `"$RemoteName`"}"
}

Invoke-RestMethod `
    -Uri "https://content.dropboxapi.com/2/files/download" `
    -Method POST `
    -Headers $headers `
    -OutFile $LocalFile

Write-Output "Téléchargement Dropbox terminé : $LocalFile"
