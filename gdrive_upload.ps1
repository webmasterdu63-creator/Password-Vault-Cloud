param(
    [string]$TokenFile,
    [string]$LocalFile,
    [string]$RemoteName = "vault.enc"
)

if (-not (Test-Path $TokenFile)) {
    Write-Error "Token OAuth Google Drive introuvable."
    exit 1
}

$token = Get-Content $TokenFile -Raw | ConvertFrom-Json
$accessToken = $token.access_token

$uploadUrl = "https://www.googleapis.com/upload/drive/v3/files?uploadType=media"

$response = Invoke-RestMethod -Uri $uploadUrl `
    -Headers @{ Authorization = "Bearer $accessToken" } `
    -Method POST `
    -InFile $LocalFile `
    -ContentType "application/octet-stream"

# Mise à jour du nom du fichier
$fileId = $response.id

Invoke-RestMethod `
    -Uri "https://www.googleapis.com/drive/v3/files/$fileId" `
    -Headers @{ Authorization = "Bearer $accessToken" } `
    -Method PATCH `
    -Body (@{ name = $RemoteName } | ConvertTo-Json) `
    -ContentType "application/json"

Write-Output "Upload Google Drive terminé : $RemoteName"

