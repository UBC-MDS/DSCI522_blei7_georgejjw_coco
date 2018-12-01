#! /usr/bin/env Rscript
# visualize_mean.R
# Bailey Lei, George J. J. Wu, Nov 2018

# This script loads a data file and outputs a dot plot of 
# mean chocolate darkness (cocoa percentage) by chocolate ratings group. 
# This script takes two arguments - a path or filename by which to load the data, 
# and a path or filename by which to save the dot plot.

# Usage: Rscript visualize_mean.R ../data/cleaned_coco.csv ../results/mean_darkness_rating.jpg

# load libraries
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(broom))
suppressPackageStartupMessages(library(infer))
suppressPackageStartupMessages(library(testthat))


# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]

# define main function
main <- function() {
  
  # load data
  suppressMessages(coco <- read_csv(input))
  
  # unit test
  test_that('Incorrect data dimensions', {
    expect_equal(dim(coco)[1], 1795)
    expect_equal(dim(coco)[2], 2)
  })
  
  # categorize expert ratings to high and low
  coco <- coco %>% 
    mutate(rating_group = if_else(rating > 3, "high", "low"))
  
  # generate a tibble with 95% CIs for each ratings group
  high_ci <- coco %>%
    filter(rating_group == "high") %>% 
    specify(response = darkness) %>% 
    generate(reps = 1000) %>% 
    calculate(stat = "mean") %>% 
    get_ci()
  
  high_ci$group <- "high"
  
  low_ci <- coco %>%
    filter(rating_group == "low") %>% 
    specify(response = darkness) %>% 
    generate(reps = 1000) %>% 
    calculate(stat = "mean") %>% 
    get_ci()
  
  low_ci$group <- "low"
  
  cis <- bind_rows(high_ci, low_ci)
  
  coco_estimates <- coco %>% 
    group_by(rating_group) %>% 
    summarise(mean_darkness = mean(darkness)) %>% 
    left_join(cis, by = c("rating_group" = "group"))
  
  # rename columns
  colnames(coco_estimates) <- c("rating_group", "mean_darkness", "lower_ci", "upper_ci")
  
  # visualize mean chocolate ratings by ratings group
  coco_estimates %>% 
    ggplot(aes(x = fct_reorder(rating_group, mean_darkness, .desc = TRUE), y = mean_darkness)) +
    geom_point() +
    geom_errorbar(aes(ymin = lower_ci, ymax = upper_ci), width = 0.1) +
    xlab("Chocolate expert ratings") +
    ylab("Mean chocolate darkness (cocoa percentage)") +
    scale_x_discrete(labels = c("Low quality", "High quality")) +
    theme_minimal() +
    theme(axis.title = element_text(size = 8))
  
  # save figure
  suppressMessages(ggsave(output, width = 5, height = 3.5))
  print("Mean chocolate darkness by ratings group successfully saved.")
  
}

# call the main function
main()