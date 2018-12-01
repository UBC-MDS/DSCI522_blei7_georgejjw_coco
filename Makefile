# Makefile script
# Contributors: Bailey Lei, George J. J. Wu

# This Makefile script completes the exploratory analysis of
# over 1700 chocolate bars. This script will generate a report
# containing figures and tables that depict the relationship between
# chocolate darkness (cocoa percentage) and chocolate expert ratings.
# This script takes no arguments.
#
# Usage: make all

# define make all
all : doc/final_report.md

# prepare data
data/cleaned_coco.csv : data/flavors_of_cacao.csv src/prepare_data.R
	Rscript src/prepare_data.R data/flavors_of_cacao.csv data/cleaned_coco.csv

 # generate visualizations
results/darkness_dist.jpg : data/cleaned_coco.csv src/visualize_darkness.R
	Rscript src/visualize_darkness.R data/cleaned_coco.csv results/darkness_dist.jpg

results/rating_dist.jpg : data/cleaned_coco.csv src/visualize_rating.R
	Rscript src/visualize_rating.R data/cleaned_coco.csv results/rating_dist.jpg

results/scatter_darkness_rating.jpg : data/cleaned_coco.csv src/visualize_scatter.R
	Rscript src/visualize_scatter.R data/cleaned_coco.csv results/scatter_darkness_rating.jpg

results/mean_darkness_rating.jpg : data/cleaned_coco.csv src/visualize_mean.R
	Rscript src/visualize_mean.R data/cleaned_coco.csv results/mean_darkness_rating.jpg

# compute descriptive statistics
results/darkness_stats.csv : data/cleaned_coco.csv src/describe_darkness.R
	Rscript src/describe_darkness.R data/cleaned_coco.csv results/darkness_stats.csv

results/rating_stats.csv : data/cleaned_coco.csv src/describe_rating.R
	Rscript src/describe_rating.R data/cleaned_coco.csv results/rating_stats.csv

# compute correlation
results/cor_pearson.csv : data/cleaned_coco.csv src/compute_pearson.R
	Rscript src/compute_pearson.R data/cleaned_coco.csv results/cor_pearson.csv

# conduct t-test
results/ttest.csv : data/cleaned_coco.csv src/compute_ttest.R
	Rscript src/compute_ttest.R data/cleaned_coco.csv results/ttest.csv

# generate final report
doc/final_report.md : src/generate_report.Rmd data/cleaned_coco.csv results/darkness_dist.jpg results/rating_dist.jpg results/scatter_darkness_rating.jpg results/mean_darkness_rating.jpg results/darkness_stats.csv results/rating_stats.csv results/cor_pearson.csv results/ttest.csv
	Rscript -e "rmarkdown::render('src/generate_report.Rmd', output_file = 'final_report.md', output_dir = 'doc')"

# define clean state
clean :
	rm -f data/cleaned_coco.csv
	rm -f results/darkness_dist.jpg
	rm -f results/rating_dist.jpg
	rm -f results/scatter_darkness_rating.jpg
	rm -f results/mean_darkness_rating.jpg
	rm -f results/darkness_stats.csv
	rm -f results/rating_stats.csv
	rm -f results/cor_pearson.csv
	rm -f results/ttest.csv
	rm -f doc/final_report.md doc/final_report.html
