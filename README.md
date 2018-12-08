# Chocolate bar ratings analysis

Contributors: Bailey Lei, George J. J. Wu

Project URL: https://github.com/UBC-MDS/DSCI_522_blei7_georgejjw_coco

Are darker chocolate simply better chocolate? This project explored the relationship between chocolate darkness (cocoa percentage) and chocolate expert ratings.

This project observed a weak and negative Pearson correlation between chocolate darkness and expert ratings. Using a Welch's t-test, this project also observed that the mean chocolate darkness difference between low and high quality chocolate bars was practically trivial. There seemed to be no clear relationship between chocolate darkness and expert ratings. Limitations and future directions of this project were discussed.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Chocolate_bar.png/800px-Chocolate_bar.png)

### Dataset

The cocoa percentage and expert ratings of over 1,700 chocolate bars were sourced from [Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings) under the [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) license.

For a detailed description of the data set, please see [Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings/home).

### To Run this analysis

#### Using Docker

1. Install and configure [Docker](https://docs.docker.com/get-started/).

2. Install the docker image for this project by using the terminal command:

> Please note that this docker image is about 698mb in size.

```
docker pull wuj4979/mds-coco-analysis
```

3. Clone/download this repository, and navigate to the root of this project.

4. Reset the project to its initial state by executing the terminal command:

```
docker run --rm -v PATH_TO_THIS_REPO:/home/DSCI_522_blei7_georgejjw_coco wuj4979/mds-coco-analysis make -C "home/DSCI_522_blei7_georgejjw_coco" clean
```

> Replace PATH_TO_THIS_REPO with the absolute path to the root of this project on your computer.

> For Windows users, please use CMD or PowerShell to execute the command, and use Windows style path such as `//C/Users/blei/Downloads/DSCI_522_blei7_georgejjw_coco`.

5. Run the data analysis with the following terminal command:

```
docker run --rm -v PATH_TO_THIS_REPO:/home/DSCI_522_blei7_georgejjw_coco wuj4979/mds-coco-analysis make -C "home/DSCI_522_blei7_georgejjw_coco" all
```

> Replace PATH_TO_THIS_REPO with the absolute path to the root of this project on your computer.

> For Windows users, please use CMD or PowerShell to execute the command, and use Windows style path such as `//C/Users/blei/Downloads/DSCI_522_blei7_georgejjw_coco`.

A final report will be compiled at `doc/final_report.md` and `doc/final_report.html`.

#### Using GNU Make

If you don't have `Docker` installed, you can also run this analysis by using GNU Make as follows.

1. Clone/download this repository, and navigate to the root of this project.

2. Reset the project to its initial state by executing the terminal command:

```
make clean
```

3. Run the data analysis by executing the terminal command:

```
make all
```

> Please make sure to have all the dependencies for this project installed before executing this command.

The `make all` command will automatically generate all relevant data files and figures for this project.

A final report will be compiled at `doc/final_report.md` and `doc/final_report.html`.

#### Using shell script

If you don't have `Docker` or `Make` installed, you can also run this analysis by using a shell script.

1. Clone/download this repository, and navigate to the root of this project.

2. Run the analysis by executing the terminal command:

```
bash run_all.sh
```

> Please make sure to have all the dependencies for this project installed before executing the shell script.

The shell script will execute the following commands.

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

Here is a brief description of each script.

| Name | Description |
| -- | -- |
| prepare_data.R | Prepares the original data set and save the cleaned data |
| visualize_darkness.R | Generates and saves a histogram for chocolate darkness |
| visualize_rating.R | Generates and saves a bar chart for chocolate expert ratings |
| visualize_scatter.R | Generates and saves a scatterplot of chocolate darkness and ratings |
| visualize_mean.R | Generates and saves a dot plot comparing mean chocolate darkness |
| describe_darkness.R | Computes and saves descriptive statistics of chocolate darkness |
| describe_rating.R | Computes and saves descriptive statistics of expert ratings |
| compute_pearson.R | Computes and saves correlation between chocolate darkness and ratings |
| compute_ttest.R | Conducts t-test comparing mean chocolate darkness between rating groups |
| generate_report.Rmd | Compiles final report into markdown file |

<!-- Here is a flowchart depicting the relationships among the scripts. -->

![]()

Upon executing the above scripts, a final report for this analysis will be generated inside the `doc` folder under the filename `final_report.md` and `final_report.html`.

### Dependencies

- GNU Make (≥ 4.1)

- R (≥ 3.0.2)

- R packages:

  - tidyverse (≥ 1.2.1)
  - readr (≥ 1.2.0)
  - infer (≥ 0.4.0)
  - knitr (≥ 1.17)
  - rmarkdown (≥ 1.7.4)
  - here (≥ 0.1)
  - testthat (≥ 2.0.1)
