---
title: Detecting Dividing Prorocentrum with Vision Transformers
date: 2026-02-16
tags:
  - project
  - deep-learning
  - phytoplankton
  - computer-vision
---
A Vision Transformer fine-tuned to detect dividing cells of *Prorocentrum* from IFCB imagery, enabling automated estimation of in situ division rates.

## Overview

Measuring phytoplankton division rates in situ is critical for understanding population dynamics and bloom formation, but manually identifying dividing cells in large image datasets is prohibitively time-consuming. This model automates that task by classifying IFCB images of *Prorocentrum* as **dividing** or **non-dividing**, allowing high-throughput estimation of division frequency from continuous IFCB time series.

## Why Division Rates Matter

Traditional methods for estimating phytoplankton growth rates (bottle incubations, dilution experiments) alter the natural environment and can introduce artifacts. Identifying dividing cells directly from in situ imagery provides a non-invasive, high-frequency measure of population growth that preserves natural conditions.

## Model Details

- **Architecture:** Vision Transformer (ViT), fine-tuned from `google/vit-base-patch16-224-in21k`
- **Task:** Binary classification (dividing vs. non-dividing)
- **Target organism:** *Prorocentrum* spp.

## Applications

- Estimating diel division patterns from continuous IFCB deployments
- Relating division rates to environmental drivers (nutrients, temperature, light)
- Monitoring bloom dynamics in near real-time

## Links

- **[Model on HuggingFace](https://huggingface.co/patcdaniel/vit-dividing-prorocentrum)**
