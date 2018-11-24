#! /usr/bin/env Rscript
# compute_ttest.R
# Bailey Lei, George J. J. Wu, Nov 2018

# This script loads a data file and outputs the t-test statistics and its p-value
# between the mean chocolate darkness (cocoa percentage) for each chocolate ratings group. 
# This script takes two arguments - a path or filename by which to load the data, 
# and another path or filename by which to save the results in a csv file.

# Usage: Rscript compute_ttest.R ../data/cleaned_coco.csv ../results/ttest.csv

# load libraries
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(broom))

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]

# define main function
main <- function() {
  
  # load data
  suppressMessages(coco <- read_csv(input))
  
  # categorize expert ratings to high and low
  coco <- coco %>% 
    mutate(rating_group = if_else(rating > 3, "high", "low"))
  
  # conduct t-test
  results <- t.test(darkness ~ rating_group, data = coco, var.equal = FALSE) %>% 
    tidy()
  
  # output part of the results
  results[, 4:10] %>% 
    write_csv(output)
  
  print("t-test results successfully saved.")
  
}

# call the main function
main()