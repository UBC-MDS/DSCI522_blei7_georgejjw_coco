#! /usr/bin/env Rscript
# cocoa_summary.R
# Bailey Lei, George J. J. Wu, Nov 2018
#
# This script loads a data file and outputs
# a summary statistic of Cocoa content of the chocolate. This script takes two arguments -
# a path or filename by which to load the data, and another path or filename
# by which to save the csv file.
#
# Usage: Rscript cocoa_summary.R ../data/cleaned_coco.csv ../results/cocoa_summary.csv


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
  
  # summary statistic of cocoa content and stored it in a dataframe
  coco <- tidy(summary(coco$darkness))
  
  # save cleaned data to csv
  coco %>% write_csv(output)
  print("File successfully saved.")
  
}

# call the main function
main()