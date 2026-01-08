---
title: NPZD Model Simulator
date: 2026-01-07
tags:
  - project
  - oceanography
  - modeling
  - interactive
---

# NPZD Model Simulator

An interactive web-based simulator for visualizing Nutrient-Phytoplankton-Zooplankton-Detritus (NPZD) ecosystem dynamics.

![NPZD Model](https://patcdaniel.github.io/npz-model/)

## Features

- **Interactive Visualization**: Toggle between time series plots and flow diagrams
- **Real-time Parameter Control**: Adjust 11 biological parameters with instant feedback
- **Multiple View Modes**:
  - Time series showing population dynamics over time
  - Flow diagram with circles sized by concentration and arrows scaled by flux rates
- **Speed Controls**: Run simulation at 1x, 2x, 4x, or 10x speed
- **Accurate Numerics**: Implements Runge-Kutta 4th order integration for stable, precise calculations

## Model Equations

The simulator implements a 4-compartment marine ecosystem model with Michaelis-Menten nutrient uptake and Ivlev grazing functional response:

- **N** (Nutrients): Inorganic nutrients available for uptake
- **P** (Phytoplankton): Primary producers
- **Z** (Zooplankton): Grazers
- **D** (Detritus): Dead organic matter

## Try It Out

**[Launch NPZD Simulator →](https://patcdaniel.github.io/npz-model/)**

## Technical Details

- Built with [p5.js](https://p5js.org/) for visualization
- Fully client-side - no server required
- Responsive design works on desktop and mobile
- Open source on [GitHub](https://github.com/patcdaniel/npz-model)

## Inspiration

Inspired by [bradyrx/NPZD-Model](https://github.com/bradyrx/NPZD-Model) - an excellent Jupyter notebook implementation of similar dynamics.

## Use Cases

- Educational tool for understanding marine ecosystem dynamics
- Exploring parameter sensitivity in plankton models
- Demonstrating nutrient cycling pathways
- Testing hypotheses about ecosystem stability and oscillations
