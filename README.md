# From Prompts to Parameters: Integrating LLMs and Agent-Based Modeling for Policy-Oriented Resilience Analysis

This repository contains the NetLogo codes developed for the book chapter:

From Prompts to Parameters: Integrating LLMs and Agent-Based Modeling for Policy-Oriented Resilience Analysis

The chapter studies how Large Language Models (LLMs) can support the construction of Agent-Based Models (ABMs) for policy-oriented resilience analysis. The models use a simple resource-conservation policy example, where agents decide whether to adopt conservation behavior such as reducing water or energy consumption.

The purpose of this repository is to show how a simple LLM-generated model can be improved step by step through more structured prompting, clearer behavioral rules, meaningful agent heterogeneity, and network-based social influence.

## Files in This Repository

```text
models/
├── 01_naive_model.nlogo
├── 02_probabilistic_extension.nlogo
├── 03_agent_profiles_extension.nlogo
└── 04_network_influence_extension.nlogo
```

## NetLogo Models Included

### 1. Naive Model

This is the first and simplest version of the model.

Agents decide whether to conserve resources based on:

- policy strength
- environmental attitude
- local social influence
- resistance to change

This model shows the limitations of directly translating a broad qualitative LLM prompt into an executable agent-based model.

### 2. Probabilistic Extension

This version improves the first model by using a probabilistic decision rule.

Instead of using a simple adoption score, agents calculate a decision tendency based on policy strength, attitude, social influence, and resistance. This decision tendency is then converted into an adoption probability using a logistic function.

This makes the behavioral rule clearer and more suitable for simulation.

### 3. Agent Profiles Extension

This version adds different types of agents.

Agents are divided into three behavioral profiles:

- committed agents
- social agents
- resistant agents

Each type has different levels of environmental motivation, social responsiveness, and resistance to change.

This makes the model more realistic than treating all agents as randomly different individuals.

### 4. Networked Social Influence Extension

This version adds social network links between agents.

Agents are influenced by their connected contacts rather than only by nearby agents in physical space.

This model shows how social networks can affect the diffusion of conservation behavior and policy response.

## Requirements

To run the models, you need:

- NetLogo 6.x or later

NetLogo can be downloaded here:

https://ccl.northwestern.edu/netlogo/

## How to Run

1. Download or clone this repository.
2. Open NetLogo.
3. Open one of the .nlogo files from the models/ folder.
4. Click setup to initialize the model.
5. Click go to run the simulation.
6. Change the sliders and parameters to explore different scenarios.

## Suggested Experiments

You can use the models to explore questions such as:

- How does policy strength affect conservation adoption?
- Does social influence increase adoption?
- How does resistance to change slow down adoption?
- How does the initial share of conserving agents affect the result?
- How do committed, social, and resistant agents behave differently?
- How does population composition affect policy outcomes?
- How does network structure influence the spread of conservation behavior?

## Main Parameters

| Parameter | Description |
|---|---|
| population | Number of agents in the simulation |
| policy-strength | Strength or visibility of the conservation policy |
| initial-conservation-rate | Initial share of agents already conserving |
| base-consumption | Consumption level of non-conserving agents |
| conservation-effect | Reduction in consumption when agents conserve |
| social-radius | Radius for local social influence in spatial models |
| beta-policy | Weight of policy strength in the probabilistic model |
| beta-attitude | Weight of environmental attitude |
| beta-social | Weight of social influence |
| beta-resistance | Weight of resistance to change |
| relapse-factor | Probability factor for returning from conserving to non-conserving behavior |
| committed-share | Share of committed agents |
| social-share | Share of socially responsive agents |
| average-degree | Average number of social network links per agent |

## Methodological Purpose

These models are not intended to be calibrated policy tools.

They are simplified exploratory models designed to show how LLM-assisted ABM construction can move through several stages:

1. a naive model based on a broad prompt
2. a model with a clearer probabilistic decision rule
3. a model with meaningful agent types
4. a model with network-based social influence

The main idea is that prompt design matters. More structured prompts can help produce behavioral mechanisms that are easier to translate into model rules and parameters.

## Citation

If you use this repository, please cite the related book chapter:

@incollection{can_pourpouneh_turkeli_2025,
  title     = {From Prompts to Parameters: Integrating LLMs and Agent-Based Modeling for Policy-Oriented Resilience Analysis},
  author    = {Can, Burak and Pourpouneh, Mohsen and T{"u}rkeli, Serdar},
  booktitle = {Futuresilience},
  year      = {2025},
  note      = {Book chapter}
}

## Authors

Burak Can
Mohsen Pourpouneh
Serdar Türkeli

## Disclaimer

The models are simplified and exploratory. The parameter values are illustrative and should not be interpreted as empirically validated estimates.

The repository is intended for academic, educational, and methodological use.


