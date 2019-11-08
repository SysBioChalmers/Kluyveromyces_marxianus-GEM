# Kluyveromyces_marxianus-GEM: The consensus genome-scale metabolic model of _Kluyveromyces marxianus_

[![GitHub version](https://badge.fury.io/gh/sysbiochalmers%2Fkluyveromyces_marxianus-gem.svg)](https://badge.fury.io/gh/sysbiochalmers%2Fkluyveromyces_marxianus-gem) [![Join the chat at https://gitter.im/SysBioChalmers/Kluyveromyces_marxianus-GEM](https://badges.gitter.im/SysBioChalmers/kluyveromyces_marxianus-gem.svg)](https://gitter.im/SysBioChalmers/Kluyveromyces_marxianus-GEM?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

* Brief Model Description:

This repository contains the current consensus genome-scale metabolic model of _Kluyveromyces marxianus_. For the latest release please [click here](https://github.com/SysBioChalmers/Kluyveromyces_marxianus-GEM/releases).

* Model KeyWords:

**GEM Category:** species; **Utilisation:** experimental data reconstruction, multi-omics integrative analysis, _in silico_ strain design, model template; **Field:** metabolic-network reconstruction; **Type of Model:** reconstruction, curated; **Model Source:** iOD907, [yeast-GEM](https://github.com/SysBioChalmers/yeast-GEM); **Omic Source:** genomics; **Taxonomy:** _Kluyveromyces marxianus_; **Metabolic System:** general metabolism; **Bioreactor**; **Strain;** **Condition:** aerobic, glucose-limited, defined media;

* Last update: 2018-05-25

* Main Model Descriptors:

|Taxonomy | Template Model | Reactions | Metabolites| Genes |
|:-------:|:--------------:|:---------:|:----------:|:-----:|
|_Kluyveromyces marxianus_|iOD907|1913|1531|996|

This repository is administered by Simonas Marcišauskas ([@simas232](https://github.com/simas232)), Division of Systems and Synthetic Biology, Department of Biology and Biological Engineering, Chalmers University of Technology.

## Installation

### Required Software - User:

* MATLAB user:
  * A functional MATLAB installation (2016b or higher)
  * The [COBRA Toolbox for MATLAB](https://github.com/opencobra/cobratoolbox)
* Python user:
  * Python 2.7, 3.4, 3.5 or 3.6
  * [cobrapy](https://github.com/opencobra/cobrapy)

### Required Software - Contributor:

* Both of the previous MATLAB requirements.
* The [RAVEN Toolbox for MATLAB](https://github.com/SysBioChalmers/RAVEN)
* A [git wrapper](https://github.com/manur/MATLAB-git) added to the search path

### Dependencies - Recommended Software:
* For MATLAB, the [libSBML MATLAB API](https://sourceforge.net/projects/sbml/files/libsbml/MATLAB%20Interface/) (version 5.17.0 is recommended)
* [Gurobi Optimizer](http://www.gurobi.com/registration/download-reg) for any simulations

### Installation Instructions
* For users: Clone it from [`master`](https://github.com/SysBioChalmers/Kluyveromyces_marxianus-GEM) in the Github repo, or just download [the latest release](https://github.com/SysBioChalmers/Kluyveromyces_marxianus-GEM/releases).
* For contributors: Fork it to your Github account, and create a new branch from [`devel`](https://github.com/SysBioChalmers/Kluyveromyces_marxianus-GEM/tree/devel).

## Usage

Make sure to load/save the model with the corresponding wrapper functions!
* In MATLAB:
  * Loading: `complementaryScripts/loadYeastModel.m`
  * Saving: `complementaryScripts/saveYeastModel.m`
* In Python:
  * Loading: `complementaryScripts/loadYeastModel.py`
  * Saving: currently unavailable

## Model Files

The model is available in `.xml`, `.txt`, `.yml`, `.mat` and `.xlsx` (the last 2 extensions only in `master`). Additionally, the following 2 files are available:
* `dependencies.txt`: Tracks versions of toolboxes & SBML used for saving the model.
* `boundaryMets.txt`: Contains a list of all boundary metabolites in model, listing the id and name.

### Complementary Scripts

* `missingFields`: Folder with functions for adding missing fields to the model.
* `modelCuration`: Folder with curation functions.
* `otherChanges`: Folder with other types of changes.
* `increaseVersion.m`: Updates the version of the model in `version.txt` and as metaid in the `.xml` file. Saves the model as `.mat` and as `.xlsx`
* `loadYeastModel.m`: Loads the yeast model from the `.xml` file for MATLAB.
* `loadYeastModel.py`: Loads the yeast model from the `.xml` file for Python.
* `saveYeastModel.m`: Saves yeast model as a `.xml`, `.yml` and `.txt` file, and updates `boundaryMets.txt` and `dependencies.txt`.

### Complementary Data

* `BiomassComposition`: The detailed information about the biomass composition considered in the model.
* `Proteome`: The list of all proteins for DMKU3-1042 strain. Useful when one wants to convert _K. marxianus_ genes to _S. cerevisiae_ and perform gene knockout simulations.

## Citation

>Marcišauskas S, Ji B, Nielsen J (2019). Reconstruction and analysis of a _Kluyveromyces marxianus_ genome-scale metabolic model. BMC Bioinformatics 20:551. doi:[10.1186/s12859-019-3134-5](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-019-3134-5)

## Contributing

Contributions are always welcome! Please read the [contributions guideline](https://github.com/SysBioChalmers/Kluyveromyces_marxianus-GEM/blob/master/.github/CONTRIBUTING.md) to get started.

## Contributors

* [Simonas Marcišauskas](https://www.chalmers.se/en/Staff/Pages/simmarc.aspx) ([@simas232](https://github.com/simas232)), Chalmers University of Technology, Sweden
