#!/bin/bash
echo 'Auto-deploying SymbioteOne-Orchestrator...'
git init
git config core.autocrlf input
git add .
git commit -m "Initial full deployment"
git remote add origin https://github.com/TheRickyFoster/SymbioteOne-Orchestrator.git
git branch -M main
git fetch origin
git rebase origin/main || echo "No remote history, skipping rebase"
git push -u origin main --force
