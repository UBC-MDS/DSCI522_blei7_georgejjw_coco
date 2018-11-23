#! /usr/bin/env Rscript
# compute_kendall.R
# Bailey Lei, George J. J. Wu, Nov 2018

# This script loads a data file and outputs the Kendall's Tau correlation coefficient 
# between chocolate darkness (cocoa percentage) and chocolate ratings. 
# This script takes two arguments - a path or filename by which to load the data, 
# and another path or filename by which to save the results in a csv file.

# Usage: Rscript compute_kendall.R ../data/cleaned_coco.csv ../results/cor_kendall.csv

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
  
  # Compute Kendall's Tau and save results
  cor.test(coco$darkness, coco$rating, method="kendall") %>% 
    tidy() %>% 
    write_csv(output)
  
  print("Kendall's correlation results successfully saved.")
  
}

# call the main function
main()