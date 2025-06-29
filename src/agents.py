# src/agents.py
from crewai import Agent

def create_agents():
    return [
        Agent(role="Mediator", goal="Diffuse conflict using language models", tools=["SentimentAnalyzer"]),
        Agent(role="Strategist", goal="Formulate healing missions", tools=["LangChainPlanner"])
    ]
