#! /usr/bin/env Rscript
# compute_pearson.R
# Bailey Lei, George J. J. Wu, Nov 2018

# This script loads a data file and outputs the Pearson correlation coefficient
# between chocolate darkness (cocoa percentage) and chocolate ratings.
# This script takes two arguments - a path or filename by which to load the data,
# and another path or filename by which to save the results in a csv file.

# Usage: Rscript compute_pearson.R ../data/cleaned_coco.csv ../results/cor_pearson.csv

# load libraries
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(broom))
suppressPackageStartupMessages(library(testthat))

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]

# define main function
main <- function() {

  # load data
  suppressMessages(coco <- read_csv(input))

  # Compute Pearson correlation and save results
  coco <- cor.test(coco$darkness, coco$rating, method="pearson") %>%
            tidy() %>%
            write_csv(output)

  print("Pearson's correlation results successfully saved.")
  
  #Unit test
  test_that('correct values', {
    expect_equal(round(coco[[1]],3), -0.165)
    expect_equal(round(coco[[2]],2), -7.08)
  })

}

# call the main function
main()
