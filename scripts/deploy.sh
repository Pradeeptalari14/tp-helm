#!/usr/bin/env bash
set -euo pipefail
ENV="${1:-staging}"
helm upgrade --install myapp ./charts/myapp \
  -f charts/myapp/values-${ENV}.yaml \
  --namespace production \
  --create-namespace \
  --wait \
  --timeout 5m
helm status myapp -n production