#! /usr/bin/env Rscript
# visualize_darkness.R
# Bailey Lei, George J. J. Wu, Nov 2018

# This script loads a data file and outputs
# a histogram of chocolate darkness (cocoa percentage). This script 
# takes two arguments - a path or filename by which to load the data, 
# and a path or filename by which to save the figure.

# Usage: Rscript visualize_darkness.R ../data/cleaned_coco.csv ../results/darkness_dist.jpg

# load libraries
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(testthat))


# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]

# define main function
main <- function() {

  # load data
  suppressMessages(coco <- read_csv(input))

  # visualize distribution of chocolate darkness
  coco %>% ggplot(aes(x = darkness)) +
    geom_histogram(bins = 40) +
    xlab("Chocolate darkness (cocoa percentage)") +
    ylab("Frequency") +
    theme_minimal() +
    theme(axis.title = element_text(size = 8))
 
  # save figure
  suppressMessages(ggsave(output, width = 5, height = 2.5))
  print("Distribution of chocolate darkness successfully saved.")
  
  #Unit test
  test_that('correct dimension', {
    expect_equal(dim(coco)[1], 1795)
    expect_equal(dim(coco)[2], 2)
  })
}

# call the main function
main()