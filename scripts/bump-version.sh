#!/usr/bin/env bash
set -e

# Obtém a última tag sem falhar
last_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")

# Remove o 'v' e separa major.minor.patch
ver=${last_tag#v}
IFS='.' read -r major minor patch <<< "$ver"

# Incrementa patch
patch=$((patch + 1))
new_tag="v${major}.${minor}.${patch}"

# Cria commit/tag e push
git tag -a "$new_tag" -m "Auto bump to $new_tag"
git push origin "$new_tag"

echo "New tag created and pushed: $new_tag"
