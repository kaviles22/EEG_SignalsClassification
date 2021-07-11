# EEG Signal's project

## Introduction
The following experiment aims to analyze EEG signals and classify them into four classes using AI techniques. During the execution of it we used *Matlab*, to design the stimulis, the *Emotiv EPOC* headset, to register the electrodes' data and *Python*, for data processing. Initially the experiment was designed in different colors, then for experimentation purposes we tried it only in white. The experiment process was subdivided in four main stages for organization purposes, as shown below.

![Experiment flow diagram](static/flow_diagram.PNG)

### Types of experiment
- Color experiment
  - Frecuency based
  - Evoked potential P300
- Experiment in white
  - Frecuency based
## Visual stimuli designing
Two experiments were designed: ***frecuency based*** and ***evoked potential P300***, the codes were developed in *Matlab 2020*, using the open source library [*Psychtoolbox*](http://psychtoolbox.org/download).
### Frecuency based
The frecuencies used were 7hz, 9Hz, 11Hz and 13Hz, in the case of the experiment ran in color, those frecuencies were associated with the colors blue, red, green and purple, respectively, however in the second experiment all the stimuli were shown in white. Each square oscillated at a designated frecuency during 3 sec, while the others remained opaque and still, as shown in the figure.
![Frecuency based experiment](static/frecuency.png)
### Evoked potential P300
The stimulis oscillated at a random frecuency, then three of the squares disappeared and just one remained on the frame, in theory this generated the P300 stimuli.
![P300 experiment](static/P300.png)

## Data recording
For data registration the ***Emotiv EPOC*** headset was used, it is a 14 channel wireless EEG headset that registers brain signals (in µV) through different softwares, in this project we  used the EMOTIV-PRO app, it comes with several features, however we only focused on the registration, labeling and data exportation. In the app's settings, the keys associated to the labels were configured as shown in the image below.

![P300 experiment](static/labels_EMOTIV.png)

As a first stage, we based our analysis on the responses of the occipital area of the brain, two electrodes were placed there: Occipital 1 (EEG.O1) and Occipital (EEG.O2).

![Emotiv EPOC](https://www.researchgate.net/profile/Luis_Gonzalez-Abril/publication/305370349/figure/download/fig1/AS:385435709788162@1468906442608/Emotiv-EPOC-characteristics-and-sensors-configuration-a-10-20-International-system.png)

The experiments lasted approximately 11 minutes, the records were exported as csv files:
- Color experiment: [Color Data](https://github.com/kaviles22/SenalesEEG/tree/main/Colores/DatosBrutos) 
- Experiment in white: [White Data](https://github.com/kaviles22/SenalesEEG/tree/main/Blanco/DatosBrutos)
## Data
### Data pre-processing 
Once the data was exported we focused on processing the raw files in orer to only maintain the information in which we were going to focused, those rows were: Label, EEG.O1 and EEG.O2. The data was 


