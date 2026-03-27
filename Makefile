#render final report: hr_report.Rmd
hr_report.html: hr_report.Rmd output/table_one.rds output/boxplot.rds code/03_render_report.R
	Rscript code/03_render_report.R

#building the output of code/01_make_table.R
output/table_one.rds: code/01_make_table.R
	Rscript code/01_make_table.R

#building the output of code/02_make_box.R
output/boxplot.rds: code/02_make_box.R
	Rscript code/02_make_box.R