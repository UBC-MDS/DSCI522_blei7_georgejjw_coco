
# Usage: Rscript prepare_data.R ../data/cleaned_coco.csv ../results/

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

}