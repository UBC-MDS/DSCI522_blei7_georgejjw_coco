#! /usr/bin/env Rscript
# load_data.R
# Bailey Lei, George J. J. Wu, Nov 2018
#
# This script loads the flavors_of_cacao.csv in the data folder
# and prints the first 6 rows of the data set to the terminal.
# This script takes no arguments.
#
# Usage: Rscript load_data.R

# define main function
main <- function() {
  
  # load data
  coco <- read.csv("../data/flavors_of_cacao.csv")
  
  # print the first 6 rows
  head(coco)
  
}

# call the main function
main()
