#!/bin/bash
# Password Vault Cloud - Password Generator (Bash)
# Version: 0.1
# Author: Jean (webmasterdu63-creator)

# TODO: Implement password generation logic
#!/bin/bash
# Password Vault Cloud - Password Generator (Bash)

LENGTH=16
CHARS=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --length) LENGTH="$2"; shift ;;
    --upper)  CHARS+="ABCDEFGHIJKLMNOPQRSTUVWXYZ" ;;
    --lower)  CHARS+="abcdefghijklmnopqrstuvwxyz" ;;
    --digits) CHARS+="0123456789" ;;
    --symbols) CHARS+="!@#$%^&*()-_=+[]{};:,.<>?" ;;
  esac
  shift
done

if [[ -z "$CHARS" ]]; then
  echo "Erreur : aucun type de caractère sélectionné."
  echo "Utilisation : ./password_generator.sh --length 20 --upper --lower --digits --symbols"
  exit 1
fi

PASSWORD=""
for (( i=0; i<$LENGTH; i++ )); do
  PASSWORD+="${CHARS:RANDOM%${#CHARS}:1}"
done

echo "$PASSWORD"
