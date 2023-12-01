#!/bin/bash

if [ -z "$GIT_HASH" ]; then
  echo "Erro: A variável \$GIT_HASH não foi informada."
  exit 1
fi

MAJOR=0
MINOR=0
PATCH=0

# Inverta a ordem dos commits antes de processá-los
COMMITS=$(git log --oneline $GIT_HASH..HEAD | tac)

while read -r commit; do
  TIPO=$(echo "$commit" | awk '{print $2}')
  case "$TIPO" in
    "major:")
      ((MAJOR++))
      MINOR=0
      PATCH=0
      ;;
    "break:")
      ((MAJOR++))
      MINOR=0
      PATCH=0
      ;;
    "minor:")
      ((MINOR++))
      PATCH=0
      ;;
    "feat:")
      ((MINOR++))
      PATCH=0
      ;;
    "fix:")
      ((PATCH++))
      ;;
    "patch:")
      ((PATCH++))
      ;;
    *)
      ;;
  esac
done <<< "$COMMITS"

echo "$MAJOR.$MINOR.$PATCH"
