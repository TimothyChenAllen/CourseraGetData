# CourseraGetData
Course project for the Coursera 
"Getting and Cleaning Data" course.

## Project

The goal of this project is to transform a fairly large
dataset (10299 x 561) to a tidy dataset, aggregated to the mean of each 
numeric variable as well as test subject and activity variables.
Numeric variables were reduced to only those representing the mean
and standard deviation of each reading.
See the [CodeBook](CodeBook.md) for explanations of the variables and
the dataset.

## Finished Products

The finished products of this project are:

* `feature_means.txt` - `mean`, `meanFreq`, and `std` columns, 
aggregated using `mean`
* `README.md` - Explains the project, scripts, and interactions
* `CodeBook.md` - Explanation of the datasets, transformations,
and a human-friendly listing of variables in the `feature_means.txt` file.

## Packages Required

This project requires the following packages to be installed:

* dplyr
* sqldf
* readr

## Scripts and Interactions

There are three scripts in this project:

1. `run_analysis.R` - Downloads a ZIP file of the data,
unzips and consolidates it, selects variables of interest, and aggregates
them.  `run_analysis.R` also calls `make_codebook.R` and `make_readme.R`.
2. `make_codebook.R` - Creates the `CodeBook.md` file based
on the list of variables in the final tidy dataset, transforming the
variable names into human-friendly names using the function `friendly.description`.
3. `make_readme.R` - Creates the `README.md` markdown file.
