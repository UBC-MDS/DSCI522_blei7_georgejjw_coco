#! /usr/bin/env Rscript
# prepare_data.R
# Bailey Lei, George J. J. Wu, Nov 2018
#
# This script loads a data file, prepares the data, and outputs
# a cleaned version of the data file. This script takes two arguments -
# a path or filename by which to load the data, and another path or filename
# by which to save the cleaned data.
#
# Usage: Rscript prepare_data.R ../data/flavors_of_cacao.csv ../data/cleaned_coco.csv

# load libraries
suppressPackageStartupMessages(library(tidyverse))

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]

# define main function
main <- function() {

  # load data
  suppressMessages(coco <- read_csv(input))

  # replace white space in column names with "_"
  names(coco) <- gsub("[[:space:]]+", "_", names(coco))

  # subset data
  coco <- coco[-1, ] %>% # remove first row due to duplicated column names
    select(Cocoa_Percent, Rating)

  # correct data type
  coco <- coco %>%
    mutate(
      darkness = parse_number(Cocoa_Percent) / 100,
      rating = parse_number(Rating)) %>%
    select(darkness, rating)

  # save cleaned data
  coco %>% write_csv(output)
  print("File successfully saved.")

}

# call the main function
main()
