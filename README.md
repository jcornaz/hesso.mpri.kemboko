# Kemboco
This project is a challenge of gesture recognition for the course : "Multimodal Processing Rocognition and Interaction" of the HES-SO university (Switzerland).

## Project details
* [Assignement](http://moodle.msengineering.ch/mod/resource/view.php?id=24491)
* [Practical informations](http://moodle.msengineering.ch/mod/resource/view.php?id=24490)
* [Concerned courses](http://moodle.msengineering.ch/course/view.php?id=324)

### Results report
* [Presentation](https://github.com/cornazj/MPRI_Kemboco/raw/master/doc/reports/Presentation.pdf)
* [Report](https://github.com/cornazj/MPRI_Kemboco/raw/master/doc/reports/Report.pdf)

## Data
* [training set for matlab](http://simon.ruffieux.home.hefr.ch/datasets/Dataset_segmented.mat)

## Project structure
The project folder structure is the following :

```
.
├── data (not versioned)
│   └── data files
├── opegra (not versioned)
│   └── opegra submissions archives
└── src
	├── ann
	│   ├── > ANN specifics sources
	│   └── > Trained ANNs
	├── svm
	│   ├── > SVM specifics 
	│   └── > Trained HMMs
	└── > Common sources
```

## OPEGRA
This project is evaluated by OPEGRA : [Downlad page](https://project.eia-fr.ch/chairgest/Pages/Opegra/Download.aspx)

## Contributors
* Pauline Boukhaled : SVM (CSHarp)
* Jonathan Cornaz : ANN (Matlab)