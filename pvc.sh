#!/bin/bash
# Password Vault Cloud - CLI (Bash)
# Version: 0.1

# TODO: Implement CLI commands
#!/bin/bash

CMD="$1"
shift

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$CMD" in
  generate)
    LENGTH=16
    while [[ $# -gt 0 ]]; do
      case $1 in
        --length) LENGTH="$2"; shift ;;
      esac
      shift
    done
    "$SCRIPT_DIR/../generator/password_generator.sh" --length "$LENGTH" --upper --lower --digits --symbols
    ;;

  encrypt)
    while [[ $# -gt 0 ]]; do
      case $1 in
        --master) MASTER="$2"; shift ;;
        --input)  INPUT="$2"; shift ;;
        --output) OUTPUT="$2"; shift ;;
      esac
      shift
    done
    if [[ -z "$MASTER" || -z "$INPUT" || -z "$OUTPUT" ]]; then
      echo "Usage: pvc.sh encrypt --master <pwd> --input <file> --output <file>"
      exit 1
    fi
    pwsh "$SCRIPT_DIR/../encryption/encrypt.ps1" -MasterPassword "$MASTER" -InputFile "$INPUT" -OutputFile "$OUTPUT"
    ;;

  decrypt)
    while [[ $# -gt 0 ]]; do
      case $1 in
        --master) MASTER="$2"; shift ;;
        --input)  INPUT="$2"; shift ;;
        --output) OUTPUT="$2"; shift ;;
      esac
      shift
    done
    if [[ -z "$MASTER" || -z "$INPUT" || -z "$OUTPUT" ]]; then
      echo "Usage: pvc.sh decrypt --master <pwd> --input <file> --output <file>"
      exit 1
    fi
    pwsh "$SCRIPT_DIR/../encryption/decrypt.ps1" -MasterPassword "$MASTER" -InputFile "$INPUT" -OutputFile "$OUTPUT"
    ;;

  *)
    echo "Commands: generate | encrypt | decrypt"
    exit 1
    ;;
esac
