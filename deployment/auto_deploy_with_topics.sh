#!/bin/bash
# === Automated GitHub Upload Script with Topic Setup ===

REPO_NAME="SymbioteOne-Orchestrator"
GITHUB_USER="TheRickyFoster"
DESCRIPTION="Symbiotic AI-human orchestration engine for planetary healing, built with CrewAI + LangGraph"
TOPICS="symbiote ai-human-hybrid orchestration multi-agent crewai langgraph symbiotic-intelligence symbolic-ai autonomous-agents peace-tech planetary-healing dao-recursive automation framework ai-for-good open-source-ethics"

# Initialize repo and push
cd $REPO_NAME
git init
git config user.name "$GITHUB_USER"
git config user.email "you@example.com"
git add .
git commit -m "Initial commit: Full release"
git branch -M main
git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git
git push -u origin main --force

# Set topics (requires GitHub CLI)
gh repo edit $GITHUB_USER/$REPO_NAME --description "$DESCRIPTION" --add-topic $(echo $TOPICS)
