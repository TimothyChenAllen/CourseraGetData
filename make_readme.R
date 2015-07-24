# make_readme.R - Automates creation of the README.md file.
# This file is sourced from the run_analysis.R script to ensure
# that the README.md file is current.

# Open the REAME.md file
re.con <- file("./README.md", "w+")

writeLines("# CourseraGetData\nCourse project for the Coursera 
\"Getting and Cleaning Data\" course.\n", re.con)

writeLines("## Project\n", con=re.con)
writeLines("The goal of this project is to transform a fairly large
dataset (10299 x 561) to a tidy dataset, aggregated to the mean of each 
numeric variable as well as test subject and activity variables.
Numeric variables were reduced to only those representing the mean
and standard deviation of each reading.
See the [CodeBook](CodeBook.md) for explanations of the variables and
the dataset.\n", con=re.con)

writeLines("## Finished Products\n", con=re.con)
writeLines("The finished products of this project are:\n", con=re.con)
writeLines("* `feature_means.txt` - `mean`, `meanFreq`, and `std` columns, 
aggregated using `mean` - *NOTE*: Dimensions of this dataset are 180x81, as
I include `meanFreq` as well as `mean` variables.", con=re.con)
writeLines("* `README.md` - Explains the project, scripts, and interactions",
           con=re.con)
writeLines("* `CodeBook.md` - Explanation of the datasets, transformations,
and a human-friendly listing of variables in the `feature_means.txt` file.\n",
           con=re.con)

writeLines("## Packages Required\n", con=re.con)
writeLines("This project requires the following packages to be installed:\n", con=re.con)
writeLines("* `dplyr`", con=re.con)
writeLines("* `sqldf`", con=re.con)
writeLines("* `readr`\n", con=re.con)

writeLines("## Scripts and Interactions\n", con=re.con)
writeLines("There are four scripts in this project:\n", con=re.con)
writeLines("1. `run_analysis.R` - Downloads a ZIP file of the data,
unzips and consolidates it, selects variables of interest, and aggregates
them.  `run_analysis.R` also calls `make_codebook.R` and `make_readme.R`.", con=re.con)
writeLines("2. `make_codebook.R` - Creates the `CodeBook.md` file based
on the list of variables in the final tidy dataset, transforming the
variable names into human-friendly names using the function `friendly.description`.", con=re.con)
writeLines("3. `make_readme.R` - Creates the `README.md` markdown file.", con=re.con)
writeLines("4. `unit_test.R` - Removes old files, clears the environment, and calls `run_analysis.R`", con=re.con)
# Close the README.md file
close(re.con)

