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
<p align="center">
  <img src="https://github.com/webmasterdu63-creator/Password-Vault-Cloud/blob/main/passwordVault.jpg" alt="Password-Vault-Cloud Banner" height="200px">
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
## 📁 Architecture du projet

Voici la structure complète du projet, pensée pour être claire, modulaire et adaptée aux workflows AdminSys / DevOps :

```
Password-Vault-Cloud/
│
├── password_generator.ps1 / .sh      # Génération de mots de passe
├── encrypt.ps1 / decrypt.ps1         # Chiffrement AES-256
├── vault_lib.ps1                     # Gestion du coffre
├── pvc.ps1 / pvc.sh                  # CLI principale
│
├── cloud_upload.ps1                  # OneDrive
├── cloud_download.ps1
├── gdrive_upload.ps1                 # Google Drive
├── gdrive_download.ps1
├── dropbox_upload.ps1                # Dropbox
├── dropbox_download.ps1
│
├── vault.json                        # Coffre (non chiffré)
├── vault.enc                         # Coffre chiffré
├── settings.json                     # Configuration
│
└── docs/                             # Documentation
```

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
❓ Pourquoi ce projet ?
Password‑Vault‑Cloud est né d’un constat simple :
dans les environnements AdminSys / DevOps, on manipule chaque jour des dizaines de mots de passe sensibles — services cloud, équipements réseau, comptes techniques, API keys, accès SSH…
Et trop souvent, ces informations sont :

    stockées en clair dans des fichiers texte

    dispersées sur plusieurs machines

    non synchronisées

    non chiffrées

    ou dépendantes d’outils propriétaires

J’ai voulu créer un outil qui répond à ces problématiques de manière professionnelle, portable et sécurisée.
🎯 Objectifs du projet

    Centraliser les mots de passe dans un coffre unique

    Chiffrer toutes les données avec AES‑256

    Synchroniser le coffre sur plusieurs clouds (OneDrive, Google Drive, Dropbox)

    Automatiser les opérations courantes (add, delete, list, get)

    Rester 100% multi‑OS (Windows + Linux)

    Fournir une CLI simple, claire et extensible

    Éviter toute dépendance à un service externe

🧩 Pourquoi l’avoir développé moi‑même ?

Parce qu’en tant qu’Administrateur Systèmes & Réseaux, je voulais :

    un outil open‑source, transparent et maîtrisé

    un workflow adapté aux environnements pro

    un coffre portable, utilisable sur n’importe quelle machine

    une solution sans abonnement, sans vendor lock‑in

    un projet qui reflète mes compétences en :

        scripting PowerShell & Bash

        sécurité (AES‑256, PBKDF2)

        automatisation

        intégration cloud

        structuration de projets DevOps

🚀 Ce que ce projet démontre

    Ma capacité à concevoir un outil complet de A à Z

    Ma maîtrise des environnements Windows & Linux

    Mon sens de la sécurité et des bonnes pratiques

    Ma capacité à documenter, structurer et présenter un projet pro

    Mon intérêt pour l’automatisation et les workflows modernes

    🎯 À qui s’adresse cet outil ?

Password‑Vault‑Cloud a été conçu pour répondre aux besoins réels des professionnels qui manipulent des accès sensibles au quotidien. Il s’adresse particulièrement à :
👨‍💻 Administrateurs Systèmes & Réseaux

    Gestion centralisée des accès techniques

    Coffre portable utilisable sur plusieurs machines

    Synchronisation cloud pour les environnements hybrides

🛠️ Ingénieurs DevOps

    Intégration dans des workflows automatisés

    Scripts multi‑OS (PowerShell + Bash)

    Stockage sécurisé des secrets hors des pipelines

🧪 Pentesters / Sécurité

    Coffre chiffré AES‑256

    Pas de dépendance à un service externe

    Contrôle total sur les données

🧑‍💼 Freelances IT / Consultants

    Un outil portable, simple à transporter

    Pas d’abonnement, pas de vendor lock‑in

    Fonctionne partout : Windows, Linux, Cloud

🎓 Étudiants / Passionnés en cybersécurité

    Compréhension des mécanismes de chiffrement

    Manipulation d’APIs cloud

    Construction d’un outil complet de A à Z

🧠 Compétences mises en œuvre

Ce projet démontre un ensemble solide de compétences techniques et professionnelles, très recherchées dans les métiers IT.
🔐 Sécurité & Chiffrement

    AES‑256 CBC

    PBKDF2 (100 000 itérations)

    Gestion du sel, IV, dérivation de clé

    Manipulation sécurisée des fichiers sensibles

🖥️ Scripting & Automatisation

    PowerShell 7+ (Windows / Linux)

    Bash (Linux)

    Architecture modulaire

    CLI professionnelle avec paramètres, validation, modules

☁️ Intégration Cloud

    API OneDrive (Microsoft Graph)

    API Google Drive

    API Dropbox

    Upload / Download sécurisés

    Gestion des tokens OAuth

🗄️ Structuration & Architecture

    Organisation d’un projet multi‑OS

    Séparation claire des responsabilités (librairies, CLI, cloud, crypto)

    Documentation professionnelle

    README premium orienté recruteurs

🧩 DevOps & Workflow

    Portabilité Windows/Linux

    Scripts reproductibles

    Synchronisation multi‑cloud

    Gestion d’un coffre chiffré versionné

🎨 Branding & Présentation

    Bannière GitHub professionnelle

    Badges techniques

    Documentation claire et attractive

    Mise en valeur des compétences
