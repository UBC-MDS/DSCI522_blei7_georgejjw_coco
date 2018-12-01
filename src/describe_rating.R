#! /usr/bin/env Rscript
# describe_rating.R
# Bailey Lei, George J. J. Wu, Nov 2018

# This script loads a data file and outputs a summary statistic 
# of chocolate rating. This script takes two arguments - 
# a path or filename by which to load the data, 
# and another path or filename by which to save the csv file.

# Usage: Rscript describe_rating.R ../data/cleaned_coco.csv ../results/rating_stats.csv

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
  
  # compute summary statistics of chocolate ratings
  # save it in a dataframe
  coco <- coco$rating %>% 
            summary() %>% 
            tidy() %>% 
            write_csv(output)
  
  print("Descriptive stats for rating successfully saved.")
  
  # unit test
  test_that('Inconsistent results', {
    expect_equal(coco[[1]], 1)
    expect_equal(round(coco[[2]],2), 2.88)
    expect_equal(round(coco[[3]],2), 3.25)
  })
  
}

# call the main function
main()