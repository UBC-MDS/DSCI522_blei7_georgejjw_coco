#! /usr/bin/env Rscript
# describe_darkness.R
# Bailey Lei, George J. J. Wu, Nov 2018

# This script loads a data file and outputs a summary statistic 
# of chocolate darkness (cocoa percentage). This script takes two arguments - 
# a path or filename by which to load the data, 
# and another path or filename by which to save the csv file.

# Usage: Rscript describe_darkness.R ../data/cleaned_coco.csv ../results/darkness_stats.csv

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
  
  # compute summary statistics of chocolate darkness
  # save it in a dataframe
  coco <- coco$darkness %>% 
            summary() %>% 
            tidy() %>% 
            write_csv(output)

  print("Descriptive stats for darkness successfully saved.")
  
  #Unit test
  test_that('correct values', {
    expect_equal(coco[[1]], 0.42)
    expect_equal(coco[[2]], 0.7)
    expect_equal(coco[[3]], 0.7)
  })
}

# call the main function
main()