#! /usr/bin/env Rscript
# cor_pearson.R
# Bailey Lei, George J. J. Wu, Nov 2018
#
# This script loads a data file and outputs
# a pearson correlation between Cocoa content and rating of chocolates. This script takes two arguments -
# a path or filename by which to load the data, and another path or filename
# by which to save the csv file.
#
# Usage: Rscript cor_pearson.R ../data/cleaned_coco.csv ../results/cor_pearson.csv


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
  
  # Pearson correlation summary and output in dataframe format
  coco <- tidy(cor.test(coco$darkness,coco$rating, method="pearson"))
  
  # save cleaned data to csv
  coco %>% write_csv(output)
  print("File successfully saved.")
  
}

# call the main function
main()