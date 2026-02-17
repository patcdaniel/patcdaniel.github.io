---
title: PhytoViT - Phytoplankton Image Classifier
date: 2026-02-16
tags:
  - project
  - deep-learning
  - phytoplankton
  - computer-vision
---
A Vision Transformer (ViT) fine-tuned to classify 83 phytoplankton taxa from Imaging FlowCytobot (IFCB) imagery collected in Monterey Bay and San Francisco Bay.

## Overview

PhytoViT is an image classification model built on `google/vit-base-patch16-224-in21k` and fine-tuned on ~558,000 labeled IFCB images. It achieves **95.87% overall accuracy** across 83 phytoplankton species and morphotype classes, providing a fast and reliable tool for automated plankton identification.

## Training Data

The model was trained on images from three IFCB instruments operating in California coastal waters:

| Instrument | Location |
|---|---|
| IFCB104 | Santa Cruz Municipal Wharf |
| IFCB161 | MBARI Power Buoy |
| IFCB116 | San Francisco Bay Cruises |

The full training dataset is available on HuggingFace: [Phytoplankton-UCSC-IFCB-20250801](https://huggingface.co/datasets/patcdaniel/Phytoplankton-UCSC-IFCB-20250801)

## Performance

| Metric | Score |
|---|---|
| Overall Accuracy | 95.87% |
| Weighted F1-Score | 0.959 |
| Macro F1-Score | 0.953 |

Several classes achieve near-perfect classification (F1 >= 0.99), including *Dinoflagellate cysts*, *Odontella*, *Pyramimonas*, and *Tropidoneis*. More challenging classes like *Haptophyte prymnesium* (F1 = 0.65) and *Heterocapsa triquetra* (F1 = 0.72) reflect genuine morphological ambiguity in the imagery.

## Classified Taxa

The model distinguishes 83 classes spanning diatoms, dinoflagellates, and other phytoplankton groups commonly found in California coastal waters, including genera such as *Akashiwo*, *Alexandrium*, *Chaetoceros*, *Ceratium*, *Pseudo-nitzschia*, *Skeletonema*, *Thalassiosira*, and many more.

## Limitations

- Trained exclusively on IFCB instruments in California waters — may not generalize to other microscopy systems or regions
- IFCB instruments trigger on PMT-B (chlorophyll fluorescence), so particles with low or no chlorophyll are underrepresented
- Requires domain expert validation for critical applications

## Try It Out

- **[Demo Space](https://huggingface.co/spaces/patcdaniel/ifcbSingleClassifier)** — upload an IFCB image and get a prediction
- **[Model on HuggingFace](https://huggingface.co/patcdaniel/UCSCPhytoViT83)** — download weights and model card
- **[Training Dataset](https://huggingface.co/datasets/patcdaniel/Phytoplankton-UCSC-IFCB-20250801)**
