#!/bin/bash

if [ -z "$GIT_HASH" ]; then
  echo "Erro: A variável \$GIT_HASH não foi informada."
  exit 1
fi

MAJOR=0
MINOR=0
PATCH=0

COMMITS=$(git log --oneline $GIT_HASH..HEAD)

while read -r commit; do
echo $commit
  TIPO=$(echo "$commit" | awk '{print $2}')
  echo $TIPO
  case "$TIPO" in
    "fix:")
      ((PATCH++))
      ;;
    "patch:")
      ((PATCH++))
      ;;
    "feat:")
      ((MINOR++))
      ;;
    "minor:")
      ((MINOR++))
      ;;
    "major:")
      ((MAJOR++))
      ;;
    "break:")
      ((MAJOR++))
      ;;
    *)
      ;;
  esac
done <<< "$COMMITS"

echo "$MAJOR.$MINOR.$PATCH"
