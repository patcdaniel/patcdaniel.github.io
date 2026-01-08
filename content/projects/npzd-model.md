---
title: NPZD Model Simulator
date: 2026-01-07
tags:
  - project
  - oceanography
  - modeling
  - interactive
---
An interactive web-based simulator for visualizing Nutrient-Phytoplankton-Zooplankton-Detritus (NPZD) ecosystem dynamics.
<!-- 
<img src="images/NPZD_Wire.png" style="max-width: 300px;border-radius: 10px;" alt="Example NPZD Model Wire Flow Diagram"> -->

<div class="img-container">
  <img src="images/NPZD_Wire.gif" alt="description">
</div>


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

Inspired by [bradyrx/NPZD-Model](https://github.com/bradyrx/NPZD-Model) - a Jupyter notebook implementation of similar dynamics.

## Use Cases

- Educational tool for understanding marine ecosystem dynamics
- Exploring parameter sensitivity in plankton models
- Demonstrating nutrient cycling pathways

## Suggested Activities
1. Run the NPZD model with the default conditions (at higher speed if you are impatient) and describe the cyclic pattern. Feel free to Pause things periodically when things start to change.
2. Try varying some of the parameters. How can these affect the frequency of the cycle? Can you create steady state, where parameters are in equilibrium? 
	- I was able to get a steady state by messing with grazing ( lower lambda to make the equation basically linear or lower R_m, so that grazing is always low, regardless of P)

__Discussion__
1. What are some of the broad assumptions of this model?
  - Conservation of Mass
  - Different equations to parameterize Growth and Grazing
2. What are the limits of only considering a single "Nutrient" pool?
  - Think about Fe-limitation
3. How might some of the different parameters change over a season?
