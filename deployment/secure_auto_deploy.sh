#!/bin/bash
# === Safe GitHub Upload Script with Token Safeguards ===

REPO_NAME="SymbioteOne-Orchestrator"
GITHUB_USER="TheRickyFoster"
DESCRIPTION="Symbiotic AI-human orchestration engine for planetary healing, built with CrewAI + LangGraph"
TOPICS="symbiote ai-human-hybrid orchestration multi-agent crewai langgraph symbiotic-intelligence symbolic-ai autonomous-agents peace-tech planetary-healing dao-recursive automation framework ai-for-good open-source-ethics"

# Load GitHub token securely
if [ -f ../.env ]; then
  export $(grep GITHUB_TOKEN ../.env | xargs)
else
  echo "⚠️  .env file not found! Please create it with your GITHUB_TOKEN"
  exit 1
fi

# Validate token before proceeding
TOKEN_CHECK=$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user | grep login)
if [[ $TOKEN_CHECK == *"$GITHUB_USER"* ]]; then
  echo "✅ GitHub token validated for user $GITHUB_USER"
else
  echo "❌ Invalid or expired token. Exiting..."
  exit 1
fi

# Create repo (only if not already created)
gh repo view $GITHUB_USER/$REPO_NAME > /dev/null 2>&1
if [ $? -ne 0 ]; then
  gh repo create $GITHUB_USER/$REPO_NAME --public --description "$DESCRIPTION" --confirm
fi

# Initialize and push
cd $REPO_NAME
git init
git config user.name "$GITHUB_USER"
git config user.email "you@example.com"
git add .
git commit -m "Initial commit: Full release"
git branch -M main
git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git
git push -u origin main --force

# Apply topics securely
gh repo edit $GITHUB_USER/$REPO_NAME --description "$DESCRIPTION" --add-topic $(echo $TOPICS)

echo "✅ Deployment completed with safeguards"
