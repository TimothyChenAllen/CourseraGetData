# Create the codebook

friendly.description <- function(n) {
        n <- sub(pattern="Subject", replacement="Number of test subject (1-30)", n)
        n <- sub(pattern="Activity", replacement="Activity causing readings: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS", n)
        
        n <- sub(pattern="MEAN_", replacement="Mean of ", n)
        # break up camel case words
        n <- gsub(pattern="([a-z])([A-Z])",replacement="\\1 \\2", n)
        n <- gsub(pattern="\\.",replacement=" ", n)
        
        n <- sub(" t ", " time domain ", n)
        n <- sub(" f ", " frequency domain ", n)
        n <- sub(" Acc ", " accelerometer ", n)
        n <- sub(" Gyro ", " gyroscope ", n)
        n <- sub(" Mag ", " magnitude ", n)
        n <- sub(" Mag ", " magnitude ", n)
        n <- sub(" Freq", " frequency", n)
        n
}

cb.con <- file("CodeBook.md", "w+")
writeLines("# Code Book\n", con = cb.con)
writeLines("(See the [README](README.md) for an explanation of project scripts
and their interactions.)\n", con=cb.con)

writeLines("## Data\n", con = cb.con)
writeLines("The data for this project were collected as part of the study
of [Human Activity Recognition using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones),
using readings gathered from the accelerometers
from Samsung Galaxy S smartphones.  30 subjects gave measurements
while doing a variety of activities (see *Data* below for details
of the activities).\n", con=cb.con)

writeLines("## Finished Products\n", con=cb.con)
writeLines("The finished products of this project are:\n", con=cb.con)
writeLines("* `feature_means.txt` - `mean`, `meanFreq`, and `std` columns, 
aggregated using `mean`", con=cb.con)
writeLines("* `README.md` - Explains the project, scripts, and interactions",
           con=cb.con)
writeLines("* `CodeBook.md` - Explanation of the datasets, transformations,
and a human-friendly listing of variables in the `feature_means.txt` file.\n",
           con=cb.con)

writeLines("## Data Transformations and Processing\n", con = cb.con)
writeLines("Several transformations were necessary to create the tidy
dataset required by the project:\n", con=cb.con)
writeLines("1. The data were downloaded in `zip` format and were unzipped.", con=cb.con)
writeLines("2. As the data were split into `training` and `test` datasets,
it was necessary to create a single concatenated dataset.", con=cb.con)
writeLines("3. Feature names were not valid `R` variable names, so a function
was written to create valid and descriptive variable names.", con=cb.con)
writeLines("4. Only `mean` and `standard deviation` variables were of interest,
so `dplyr::filter` and `dplyr::select` were used to reduce the set of variables
to only those containing the words `mean`, `meanFreq`, or `std`, as well as
`Subject` and `Activity`", con=cb.con)
writeLines("5. Test subject numbers and their activities were added to the
dataset.  Activites were transformed to give friendly text names.", con=cb.con)
writeLines("6. To calculate the `mean` of all remaining columns in the dataset,
`aggregate.data.frame` was used.", con=cb.con)
writeLines("7. The final dataset was written out using `write.table`.\n", con=cb.con)

writeLines("\n## Variables", con=cb.con)
writeLines("\nVariable Name|Explanation", con = cb.con)
writeLines("-----------|--------", con = cb.con)
writeLines(paste(names(feature.means), friendly.description(names(feature.means)), sep="|"),
           con = cb.con)

close(cb.con)

# require(knitr)
# knit2html(input = "CodeBook.md", "CodeBook.html")
