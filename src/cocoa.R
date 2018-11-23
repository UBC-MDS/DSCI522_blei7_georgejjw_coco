#! /usr/bin/env Rscript
# vis_data.R
# Bailey Lei, George J. J. Wu, Nov 2018
#
# This script loads a data file and outputs
# a histogram of Cocoa content in chocolate. This script takes two arguments -
# a path or filename by which to load the data, and filename of the figure.
#
# Usage: Rscript cocoa.R ../data/cleaned_coco.csv cocoa.png


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

  #histrogram of
  p<-ggplot(coco, aes(x=darkness)) +
    geom_histogram(binwidth=.02)
  p + xlab("Proportion of Cocoa")

  ggsave(output, path = "../results")
  print("Plot successfully saved.")

}

# call the main function
main()
