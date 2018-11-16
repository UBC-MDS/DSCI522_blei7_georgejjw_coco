# Chocolate bar ratings analysis

Contributors: Bailey Lei, George J. J. Wu

This project analyzes expert ratings of over 1,700 chocolate bars.

This project is hosted on [Github](https://github.com/UBC-MDS/DSCI_522_blei7_georgejjw_coco.git).

### Dataset

Chocolate bar ratings data was sourced from [Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings) under the [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) license.

There are 1,795 chocolate bars in the data set.

There are eight feature columns in the data set, which includes: company name, company location, specific bean origin, broad bean origin, bean type, review date, ref (how recent is a rating), and cocoa percentage (darkness).

There is one target column in the data set, which is expert rating. Each chocolate bar was rated using a 5-point scale, such that 1 is unpleasant, 2 is disappointing, 3 is satisfactory (3.75 is praiseworthy), 4 is premium, and 5 is elite.

For a detailed description of the data set, please see [Kaggle](https://www.kaggle.com/rtatman/chocolate-bar-ratings/home).

### Question of interest

This project aims to address the following question:

What is the relationship between cocoa percentage (chocolate darkness) and expert ratings?

This is an _exploratory_ question.

### Plan of action

##### Tools of choice

We plan to analyze the data using `R` with RStudio and the `tidyverse` library.

##### Univariate analysis

We are mainly interested in two variables - cocoa percentage and expert ratings. We will begin our exploratory analysis by examining these two variables individually.

We will check for missing or invalid values for each variable of interest, and identify the type of each variable. For instance, we want to determine if expert rating is a categorical variable or a continuous variable. We will also explore how each variable is distributed, identify outliers, and compute some descriptive summary statistics for each variable (eg. min, 1st quantile, median, mean, 3rd quantile, and max).

##### Bivariate analysis

We will then explore how cocoa percentage and expert ratings are related. We are assuming that the relationship between these two variables to be linear, and thus we will compute the Pearson correlation coefficient and its corresponding p-value between cocoa percentage and expert ratings.

### Presenting the findings

During the univariate analysis, we will visualize the distribution of each variable using a histogram. We will also present the descriptive summary statistics for each variable in a table.

For the bivariate analysis, we will plot the relationship between cocoa percentage and expert ratings using a scatterplot. We will also overlay the scatter plot with a line of best fit. We will then present the Pearson correlation coefficient between the two variables and its p-value using a table.  
