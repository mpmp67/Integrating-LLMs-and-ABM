# From Prompts to Parameters: LLM-Assisted Agent-Based Modeling for Resilience Policy Analysis

This repository contains the NetLogo agent-based models developed for the book chapter:

**“From Prompts to Parameters: Integrating LLMs and Agent-Based Modeling for Policy-Oriented Resilience Analysis”**

The chapter examines how large language models (LLMs) can support the construction of agent-based models (ABMs) for policy-oriented resilience analysis. It focuses on how different levels of prompt complexity affect the translation of qualitative policy narratives into formal model rules, behavioral assumptions, and simulation-ready parameters.

## Overview

The models in this repository illustrate a step-by-step progression from a simple LLM-inspired toy model to more structured ABM extensions. The policy example concerns household adoption of resource-conservation behavior, such as reducing water or energy consumption, under a public policy intervention.

The chapter uses this example to show that LLM outputs should not be treated as ready-made models. Instead, they are best understood as provisional inputs that require formalization, checking, and iterative refinement.

## Repository Contents

This repository includes NetLogo implementations of the models discussed in the chapter:

```text
.
├── models/
│   ├── 01_naive_model.nlogo
│   ├── 02_probabilistic_extension.nlogo
│   ├── 03_agent_profiles_extension.nlogo
│   └── 04_network_influence_extension.nlogo
├── README.md
└── LICENSE
