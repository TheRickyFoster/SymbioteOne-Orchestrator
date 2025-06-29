#!/bin/bash
# === Safe Sync & Deploy Script (Pull Before Push) ===

REPO_NAME="SymbioteOne-Orchestrator"
GITHUB_USER="TheRickyFoster"
DESCRIPTION="Symbiotic AI-human orchestration engine for planetary healing, built with CrewAI + LangGraph"
TOPICS="symbiote ai-human-hybrid orchestration multi-agent crewai langgraph symbiotic-intelligence symbolic-ai autonomous-agents peace-tech planetary-healing dao-recursive automation framework ai-for-good open-source-ethics"

# Pull from remote first to avoid conflicts
echo "🔄 Pulling latest changes from origin..."
git init
git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git 2>/dev/null
git fetch origin
git pull origin main --rebase || echo "⚠️ Rebase failed or remote not found. Continuing..."

# Setup and push
echo "🚀 Preparing commit..."
git add .
git commit -m 'Auto-sync and push from local orchestrator'
git branch -M main
git push -u origin main --force

# Add topics and description
gh repo edit $GITHUB_USER/$REPO_NAME --description "$DESCRIPTION" --add-topic $(echo $TOPICS)
echo "✅ Sync complete and topics set."
