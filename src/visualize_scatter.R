#! /usr/bin/env Rscript
# visualize_scatter.R
# Bailey Lei, George J. J. Wu, Nov 2018

# This script loads a data file and outputs a scatterplot of 
# chocolate darkness (cocoa percentage) and chocolate ratings. 
# This script takes two arguments - a path or filename by which to load the data, 
# and a path or filename by which to save the scatterplot.

# Usage: Rscript visualize_scatter.R ../data/cleaned_coco.csv ../results/scatter_darkness_rating.jpg

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
  
  # visualize scatter plot between darkness and rating
  coco %>% ggplot(aes(y = rating, x = darkness)) +
    geom_point(size = 0.8) +
    geom_smooth(method = "lm") +
    xlab("Chocolate darkness (cocoa percentage)") + 
    ylab("Expert ratings") +
    theme_minimal() +
    theme(axis.title = element_text(size = 8))
  
  # save figure
  suppressMessages(ggsave(output, width = 6, height = 3.5))
  print("Scatterplot of darkness and ratings successfully saved.")
  
}

# call the main function
main()