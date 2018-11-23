# run_all.sh
# Bailey Lei, George J. J. Wu, Nov 2018

# This driver script completes the exploratory analysis between
# chocolate darkness (cocoa percentage) and chocolate ratings.
# This script takes no arguments.

# Usage: bash run_all.sh

# prepare data
Rscript src/prepare_data.R data/flavors_of_cacao.csv data/cleaned_coco.csv

# generate visualizations
Rscript src/visualize_darkness.R data/cleaned_coco.csv results/darkness_dist.jpg
Rscript src/visualize_rating.R data/cleaned_coco.csv results/rating_dist.jpg
Rscript src/visualize_scatter.R data/cleaned_coco.csv results/scatter_darkness_rating.jpg

# compute descriptive statistics
Rscript src/describe_darkness.R data/cleaned_coco.csv results/darkness_stats.csv
Rscript src/describe_rating.R data/cleaned_coco.csv results/rating_stats.csv

# compute correlation
Rscript src/compute_pearson.R data/cleaned_coco.csv results/cor_pearson.csv
Rscript src/compute_kendall.R data/cleaned_coco.csv results/cor_kendall.csv

# make report