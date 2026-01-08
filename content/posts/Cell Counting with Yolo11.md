Insert a phytoplankton header image here

The way my brain works when thinking of a population of a phytoplankton is in terms of cells per volume. I find this intuitive. Counting is a fundamental method, it is defensible and easy to convey, although not immune to issues are round bias, skill, and sampling statistics. 

For the automated imaging system that I in my research, the Imaging FlowCytobot or IFCB, we rely on automated classifiers to identify and label images. Images are saved off the of the instrument as segmented boxes that we feed into CNNs or now Visual Transformers and they do their best to tell us what it is.

There is a glaring issue with this approach. Diatoms and some dinoflagellates often form large colonial chains. Our models are trained to identify the chains, but not to count the cells, so we are **systematically under-counting cell.** We try to skirt this issue by estimating the volume of the entire chain, [using some pretty cool algorithms.](https://www2.whoi.edu/staff/hsosik/wp-content/uploads/sites/11/2017/03/MobergSosik2012_LnOMethods.pdf) A recent paper by [Groves et al 2025, in JPR](#) trained what they call a Diatom Chain Counter Model (DCCM) for *Psuedo-nitzschia*, *Chaetoceros*, *Skeletonema*, and *Thallasiosira* using the YOLOv11 architecture to segment and count cells in a bounding box. Unsurprisingly, when applied to time series, they found that cells abundance was underrepresented before applying the model, in some case by a factor 6.97. This paper inspired two ideas: how does biovolume, now a standard "product" in IFCB processing, scale with DCCM and would using polygons, instead of bounding boxes improve the issues with overlapping cells. The authors briefly discussed biomass (a scaling of biovolume based on empirical relationships of Dinoflagellates and Diatoms), but they stop short of analyzing their model against it. 

## Goal: Train my own DCCM-type model

### Labeling Training Set
I used the [Computer Vision Annotation Tool (CVAT)](https://github.com/cvat-ai/cvat)to segment and label individual cells for -_Psuedo-nitzschia_ sp. Using the the suggested docker-compose file makes standing up the vanilla software very easy. If you want to use some of the automated segmenting tools such as the facebook SAM model, you have to jump through some [extra hoops](https://github.com/cvat-ai/cvat/issues/6441). Once setup, the platform is fairly intuitive. You generate a generate a project. Generate a Task within a project, where you can upload a directory of images, and define what labels you want to use. In this case, it is very simple, one label "pseudo-cell" that is represented as a polygon. Then you can create a "Job", where a user (ie me) is assigned  a Stage (annotation/validation/acceptance) and a Sate (new/in progress/rejected/complete). While I haven't explored the different options for users

![[images/Pasted image 20251215134641.png]]
Over a couple of hours spread out over a couple of days, I was able to get up 301 annotated images (872 cells).
### Training
Despite the relatively small dataset I was eager to train something, I split the data (60:20:20) for training, testing, and evaluation. So, I trained a model using the [YOLOv11-nano](https://github.com/ultralytics/ultralytics?tab=readme-ov-file#:~:text=Detection,-(COCO)weights and architecture. Training on my M4 macbook is pretty fast (~20 minutes) for such a small dataset.
![[images/train_batch1080.jpg]]

I like this mosaic because it illustrates the diversity in morphologies (and instruments) that are used in the training set. The cell in the bottom left corning is a pseudo-nitzschia cell that is infected by fungal symbiont. The fact that the model can still identify the cells shows that it works pretty well. In fact, from the test dataset, it works really well:
![[images/confusion_matrix_normalized.png]]

This view led me to wonder where the model was struggling. It turns out the model is a more consistent cell counter than I am! In the image below, I labeled the image on the left as having 8 cells, when the model correctly labeled 7. This actually illustrates an issue that we have in domain specific training sets, __Labeling Skill__. My taxonomic skills have improved in phytoplankton over the years, but they are limited to generally the species that I commonly see or am focused on. They are also a reflection of how I was taught, what references I use, and the conventions that I adopt.

![[images/Pasted image 20251217122633.png]]
The next step is to find the confidence threshold using the evaluation data.
![[images/D20240512T032856_IFCB161_01556_detected.png]] 


## Next Steps
__What does it all mean? (Future Post)__
The goal is to answer the question, what value is added in running this model *post-hoc*? Can we predict Pseudo-nitzschia blooms better? Does the chain length tell us anything about the type of bloom or the size of the bloom?
