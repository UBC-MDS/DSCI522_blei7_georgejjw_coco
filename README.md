# Chocolate bar ratings analysis

Contributors: Bailey Lei, George J. J. Wu

Project URL: https://github.com/UBC-MDS/DSCI_522_blei7_georgejjw_coco

Are darker chocolate simply better chocolate? This project explored the relationship between chocolate darkness (cocoa percentage) and chocolate expert ratings.

This project observed a weak and negative Pearson correlation between chocolate darkness and expert ratings. Using a Welch's t-test, this project also observed that the mean chocolate darkness difference between low and high quality chocolate bars were almost trivial. There seemed to be no clear relationship between chocolate darkness and expert ratings. Limitations and future directions were discussed.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Chocolate_bar.png/800px-Chocolate_bar.png)

### Dataset

The cocoa percentage and expert ratings of over 1,700 chocolate bars were sourced from [Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings) under the [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) license.

For a detailed description of the data set, please see [Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings/home).

### To Run this analysis

1. Clone and navigate to the root of this project.

2. In your terminal, execute commands in the following order:

```
# prepare data
Rscript src/prepare_data.R data/flavors_of_cacao.csv data/cleaned_coco.csv

# generate figures
Rscript src/visualize_darkness.R data/cleaned_coco.csv results/darkness_dist.jpg
Rscript src/visualize_rating.R data/cleaned_coco.csv results/rating_dist.jpg
Rscript src/visualize_scatter.R data/cleaned_coco.csv results/scatter_darkness_rating.jpg
Rscript src/visualize_mean.R data/cleaned_coco.csv results/mean_darkness_rating.jpg

# generate tables
Rscript src/describe_darkness.R data/cleaned_coco.csv results/darkness_stats.csv
Rscript src/describe_rating.R data/cleaned_coco.csv results/rating_stats.csv
Rscript src/compute_pearson.R data/cleaned_coco.csv results/cor_pearson.csv
Rscript src/compute_ttest.R data/cleaned_coco.csv results/ttest.csv

# compile final report
Rscript -e 'rmarkdown::render("src/generate_report.Rmd", output_file = "final_report.md", output_dir = "doc")'
```
Or you can simply execute this shell script at the root of this project:

```
bash run_all.sh
```
Here is a flowchart depicting the relationships among the scripts.

![](https://i.imgur.com/7Kmpy1U.jpg)

### Report

Upon executing the above scripts, a final report for this analysis will be generated inside the `doc` folder under the filename `final_report.md`.

### Dependencies

- R and R packages:

  - tidyverse (1.2.1)
  - infer (0.4.0)
  - knitr (1.17)
  - rmarkdown (1.7.4)
  - here (0.1)
  - testthat (2.0.1)
