#!/usr/bin/env bash


if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <commit-message>"
    exit 1
fi

git add --all
git commit -m "$@"
git push origin main