param(
    [string]$TokenFile,
    [string]$RemoteName = "vault.enc",
    [string]$LocalFile = "./vault.enc"
)

if (-not (Test-Path $TokenFile)) {
    Write-Error "Token OAuth Google Drive introuvable."
    exit 1
}

$token = Get-Content $TokenFile -Raw | ConvertFrom-Json
$accessToken = $token.access_token

# Recherche du fichier par nom
$searchUrl = "https://www.googleapis.com/drive/v3/files?q=name='$RemoteName'&fields=files(id,name)"

$search = Invoke-RestMethod -Uri $searchUrl -Headers @{ Authorization = "Bearer $accessToken" }

if ($search.files.Count -eq 0) {
    Write-Error "Fichier '$RemoteName' introuvable sur Google Drive."
    exit 1
}

$fileId = $search.files[0].id

# Téléchargement
$downloadUrl = "https://www.googleapis.com/drive/v3/files/$fileId?alt=media"

Invoke-RestMethod -Uri $downloadUrl -Headers @{ Authorization = "Bearer $accessToken" } -OutFile $LocalFile

Write-Output "Téléchargement Google Drive terminé : $LocalFile"

