# Password-Vault-Cloud
<p align="center">
  <img src="https://img.shields.io/badge/PowerShell-7+-blue?logo=powershell&style=for-the-badge" />
  <img src="https://img.shields.io/badge/Bash-Linux-green?logo=gnu-bash&style=for-the-badge" />
  <img src="https://img.shields.io/badge/AES-256%20Encryption-purple?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Multi--Cloud-OneDrive%20%7C%20GDrive%20%7C%20Dropbox-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Status-Active-success?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Platform-Windows%20%7C%20Linux-lightgrey?style=for-the-badge" />
  <img src="https://img.shields.io/github/license/webmasterdu63-creator/Password-Vault-Cloud?style=for-the-badge" />
</p>

Gestionnaire de mots de passe chiffré, multi‑OS et multi‑cloud (OneDrive, Google Drive, Dropbox)  
Un outil professionnel conçu pour les environnements AdminSys / DevOps.
🚀 Présentation

Password‑Vault‑Cloud est un gestionnaire de mots de passe en ligne de commande, sécurisé et portable.
Il combine :

    🔑 Génération de mots de passe complexes

    🔐 Chiffrement AES‑256 (PBKDF2, IV, Salt)

    🗄️ Coffre JSON modulaire

    🖥️ Compatibilité Windows / Linux (PowerShell + Bash)

    ☁️ Synchronisation Cloud : OneDrive, Google Drive, Dropbox

    🧩 CLI simple, claire et extensible

Ce projet a été conçu pour être professionnel, sécurisé, et facile à intégrer dans un workflow AdminSys/DevOps.
Password-Vault-Cloud/
│
├── password_generator.ps1 / .sh     # Génération de mots de passe
├── encrypt.ps1 / decrypt.ps1        # Chiffrement AES-256
├── vault_lib.ps1                    # Gestion du coffre
├── pvc.ps1 / pvc.sh                 # CLI principale
│
├── cloud_upload.ps1                 # OneDrive
├── cloud_download.ps1
├── gdrive_upload.ps1                # Google Drive
├── gdrive_download.ps1
├── dropbox_upload.ps1               # Dropbox
├── dropbox_download.ps1
│
├── vault.json                       # Coffre (non chiffré)
├── vault.enc                        # Coffre chiffré
├── settings.json                    # Configuration
│
└── docs/                            # Documentation

🛡️ Sécurité

Password‑Vault‑Cloud utilise :

    AES‑256 CBC

    PBKDF2 (100 000 itérations)

    Sel aléatoire (16 bytes)

    IV aléatoire (16 bytes)
    🖥️ CLI — Commandes principales
🔑 Générer un mot de passe
pvc generate -Length 24

🔐 Chiffrer le coffre
pvc encrypt -MasterPassword "xxx" -Input vault.json -Output vault.enc

Déchiffrer le coffre
pvc decrypt -MasterPassword "xxx" -Input vault.enc -Output vault.json

🗄️ Exemple d'Ajouter une entrée 
pvc add -Service github -Username jean -Password "xxxx"

📋 Lister les services
pvc list

🔍 Récupérer une entrée
pvc get -Service github

❌ Supprimer une entrée
pvc delete -Service github

☁️ Synchronisation Cloud
OneDrive
pvc sync upload
pvc sync download

Google Drive
pvc sync-gdrive upload
pvc sync-gdrive download

Dropbox
pvc sync-dropbox upload
pvc sync-dropbox download



    Fichier chiffré structuré :
