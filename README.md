# "Adjusting for Guessing and Applying a Statistical Test to the Disaggregation of Value-added Learning Scores" and "On Guessing: An Alternative Adjusted Positive Learning Estimator and Comparing Probability Misspecification with Monte Carlo Simulation" Work Repository

This repository contains the work and simulations software referenced in [Smith and Wagner (2018)](https://bensresearch.com/smithwagner) and [Smith and White (2019)](https://bensresearch.com/smithwhite).  Smith and Wagner (2018) adjusts the learning disaggregation suggested by [Walstad and Wagner (2016)](http://dx.doi.org/10.1080/00220485.2016.1146104) for student guessing on multiple choice exams.   Smith and White (2019) adds a gain estimator, probability misspecification test, and simulations comparing the accuracy of probability specification alternatives available to practitioners and researchers. 

## Work

The solutions presented in Table 1 and the equations are derived in the Mathematica notebook "Work.nb."  "Work.pdf" and "Work.cdf" (exports of Work.nb) are provided for users who do not have a copy of Mathematica.

## Monte Carlo Simulation Software

The simulation results presented in the papers can be duplicated by executing the simulation code "Simulation.py."  Simulation.py uses the libraries NumPy and Pandas that are not include in the standard download of Python.  If you wish to run the source code, we recommend you install the latest version of [Anaconda (Python 3.x version)](https://www.anaconda.com/download/) which includes these libraries.

The simulation software is available as a module ([SmithWagnerCV](https://github.com/tazzben/SmithWagnerCV)).  If you want to install it via pip, you can type the following:

```
pip install SmithWagnerCV
```

Using the conda command you can type the following:

```
conda install -c tazzben smithwagnercv  
```

Once Python is installed, you can duplicate table A1 in the paper by executing the following command in the terminal:

```
python Simulation.py
```

If you wish to change the value of _n_ (number of question options) in the simulation, you can execute the code as follows:

```
python Simulation.py  --options 5
```

Where "5" is the specified value of _n_.  

This software is also available as pre-built binaries for Windows and macOS under the releases section of this page (which does not require the installation of python or any of the libraries). Extensive critical value tables generated from this simulation software can be found at [https://goo.gl/mjIYvN](https://goo.gl/mjIYvN).

## Related Work

This paper is part of a larger project to improve learning measurements and assessment.  Software to perform this guessing-adjustment and disaggregation from Scantron or ZipGrade files is provided by [Smith (2018)](https://doi.org/10.1080/00220485.2018.1438863); the software can be downloaded at [https://tazzben.github.io/WW/](https://tazzben.github.io/WW/).