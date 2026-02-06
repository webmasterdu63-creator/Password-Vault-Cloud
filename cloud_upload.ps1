param(
    [string]$TokenFile,
    [string]$LocalFile,
    [string]$RemoteName = "vault.enc"
)

if (-not (Test-Path $TokenFile)) {
    Write-Error "Token OAuth OneDrive introuvable. Exécute d'abord l'authentification."
    exit 1
}

$token = Get-Content $TokenFile -Raw | ConvertFrom-Json
$accessToken = $token.access_token

$uploadUrl = "https://graph.microsoft.com/v1.0/me/drive/root:/$RemoteName:/content"

Invoke-RestMethod -Uri $uploadUrl -Headers @{Authorization = "Bearer $accessToken"} -Method PUT -InFile $LocalFile -ContentType "application/octet-stream"

Write-Output "Upload terminé vers OneDrive : $RemoteName"
