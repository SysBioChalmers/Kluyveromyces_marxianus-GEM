# Kluyveromyces_marxianus-GEM

- Brief Repository Description

This repository contains a genome-scale metabolic model for the ascomycetous yeast _Kluyveromyces marxianus_. The model contains 4 compartments: extracellular, cytosol, mitochondrion and endoplasmic reticulum

- Abstract:

TBA

- Model KeyWords:

**GEM Category:** Species; **Utilisation:** Predictive simulation; **Field:** Metabolic-network reconstruction; **Type of Model:** Reconstruction; **Model Source:** iOD907, Yeast 7.6; **Taxonomy:** _Kluyveromyces marxianus_; **Metabolic System:** General Metabolism;

- Reference:  TBA

- Pubmed ID: TBA

- Last update: 2018-05-25

- The model contains:

|Taxonomy | Template Model | Reactions | Metabolites| Genes |
| ------------- |:-------------:|:-------------:|:-------------:|-----:|
|_Kluyveromyces marxianus_ | iOD907 | 1913 |	1531 | 996 |

This repository is administered by Simonas Marcišauskas ([@simas232](https://github.com/simas232)), Division of Systems and Synthetic Biology, Department of Biology and Biological Engineering, Chalmers University of Technology




## Installation

### Required Software:

* A functional Matlab installation (MATLAB 7.3 or higher)
* One of the following:
  * [The RAVEN Toolbox for MATLAB](https://github.com/SysBioChalmers/RAVEN).
  * [The COBRA Toolbox for MATLAB](https://github.com/opencobra/cobratoolbox).

### Dependencies - Recommended Software:
* libSBML MATLAB API (version [5.16.0](https://sourceforge.net/projects/sbml/files/libsbml/5.16.0/stable/MATLAB%20interface/) is recommended).
* [Gurobi Optimizer for MATLAB](http://www.gurobi.com/registration/download-reg).
* For contributing to development: a [git wrapper](https://github.com/manur/MATLAB-git) added to the search path, instructions [here](https://se.mathworks.com/help/matlab/ref/addpath.html?requestedDomain=www.mathworks.com)

### Installation Instructions
* Clone [Kluyveromyces_marxianus-GEM](https://github.com/SysBioChalmers/Kluyveromyces_marxianus-GEM) from [SysBioChalmers GitHub](https://github.com/SysBioChalmers)
* Add the directory to your Matlab path, instructions [here](https://se.mathworks.com/help/matlab/ref/addpath.html?requestedDomain=www.mathworks.com)

### Contribute To Development
1. Fork the repository to your own Github account
2. Create a new branch from [`devel`](https://github.com/SysBioChalmers/Kluyveromyces_marxianus-GEM/tree/devel).
3. Make changes to the model
    + [The RAVEN Toolbox for MATLAB](https://github.com/SysBioChalmers/RAVEN) is highly recommended for making changes
    + Before each commit, run in MATLAB the `newCommit(model)` function from the `ComplementaryScripts` folder
    + Make a Pull Request to the `devel` folder, including changed `txt`, `yml` and `xml` files

## Contributors
* [Simonas Marcišauskas](https://www.chalmers.se/en/staff/Pages/simmarc.aspx) ([@simas232](https://github.com/simas232)), Chalmers University of Technology, Göteborg, Sweden
