# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# install additional packages
RUN R -e "install.packages('here')"
RUN R -e "install.packages('infer')"
RUN R -e "install.packages('testthat')"
