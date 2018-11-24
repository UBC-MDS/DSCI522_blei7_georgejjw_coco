# Chocolate bar ratings analysis

Contributors: Bailey Lei, George J. J. Wu

Project URL: https://github.com/UBC-MDS/DSCI_522_blei7_georgejjw_coco

![](https://cdn.pixabay.com/photo/2017/11/18/19/48/chocolate-2961075_960_720.jpg)

Are darker chocolate simply better chocolate? This project aims to explore the relationship between chocolate darkness (cocoa percentage) and chocolate expert ratings.

### Dataset

The cocoa percentage and expert ratings of over 1,700 chocolate bars were sourced from [Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings) under the [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) license.

For a detailed description of the data set, please see [Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings/home).

### To Run this analysis

1. Clone and navigate to the root of this project.

2. In your terminal, execute scripts in the following order:

```
Rscript src/prepare_data.R data/flavors_of_cacao.csv data/cleaned_coco.csv
Rscript src/visualize_darkness.R data/cleaned_coco.csv results/darkness_dist.jpg
Rscript src/visualize_rating.R data/cleaned_coco.csv results/rating_dist.jpg
Rscript src/visualize_scatter.R data/cleaned_coco.csv results/scatter_darkness_rating.jpg
Rscript src/visualize_mean.R data/cleaned_coco.csv results/mean_darkness_rating.jpg
Rscript src/describe_darkness.R data/cleaned_coco.csv results/darkness_stats.csv
Rscript src/describe_rating.R data/cleaned_coco.csv results/rating_stats.csv
Rscript src/compute_pearson.R data/cleaned_coco.csv results/cor_pearson.csv
Rscript src/compute_ttest.R data/cleaned_coco.csv results/ttest.csv
Rscript -e 'rmarkdown::render("src/generate_report.Rmd", output_file = "final_report.md", output_dir = "doc")' 
```
Or you can simply executing this shell script at the root of this project:

```
bash run_all.sh
```
Here is a flowchart depicting the relationships among the scripts.

![](https://i.imgur.com/7Kmpy1U.jpg)

### Report

Upon executing the above scripts, a final report for this analysis will be generated inside the `doc` folder under the filename `final_report.md`.

### Dependencies

- R and R packages:

  - tidyverse
  - broom
  - infer


