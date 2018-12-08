# Dockerfile for chocolate bar analysis project
# Contributors: Bailey Lei, George J. J. Wu

# This Dockerfile can be used to build a Docker image
# by using rocker/tidyvese as the base image
# and by also introducing some additional R packages.
# This file takes no arguments.
# Usage: docker build --tag IMAGE_NAME:VERSION .
# Example: docker build --tag mds-coco-analysis:0.1 .

# use rocker/tidyverse as the base image
FROM rocker/tidyverse

# install additional R packages
RUN R -e "install.packages('here')"
RUN R -e "install.packages('infer')"
RUN R -e "install.packages('testthat')"
