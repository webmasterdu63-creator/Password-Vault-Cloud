param(
    [string]$TokenFile,
    [string]$LocalFile,
    [string]$RemoteName = "/vault.enc"
)

if (-not (Test-Path $TokenFile)) {
    Write-Error "Token OAuth Dropbox introuvable."
    exit 1
}

$token = Get-Content $TokenFile -Raw | ConvertFrom-Json
$accessToken = $token.access_token

$headers = @{
    Authorization = "Bearer $accessToken"
    "Dropbox-API-Arg" = "{`"path`": `"$RemoteName`", `"mode`": `"overwrite`"}"
    "Content-Type" = "application/octet-stream"
}

Invoke-RestMethod `
    -Uri "https://content.dropboxapi.com/2/files/upload" `
    -Method POST `
    -Headers $headers `
    -InFile $LocalFile

Write-Output "Upload Dropbox terminé : $RemoteName"
