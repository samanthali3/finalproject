# DATA 550 Final Project

## Project Overview
This repository contains the final project for DATA 550.
The final project is analyzing employee performance, workload, and attrition, with the goal being to provide insights into how employee performance relates to attrition status.
The project produces a report that includes the below in the body of the report: 

  - Table 1 - summary statistics
  - Boxplot - visual representation

## Code Description

`code/01_make_table.R`
  - Creates the table_one (the code for generating the table is also here)
  - Saves the table_one as a `.rds` object in the `output/` folder

`code/02_make_box.R`
  - Creates the boxplot (the code for generating the boxplot is also here)
  - Saves the boxplot as a `.rds` object in the `output/` folder
  
`code_03_render_report.R`
  - Renders `hr_report.Rmd`
  
`hr_report.Rmd`
  - Loads the table_one and boxplot saved by the two `.R` scripts
  - Includes additional context to each of the figure included
  - Includes an introduction and conclusion to explain the context of the report
  
`Makefile`
  - Contains rules for building the final report
  - Typing `make` in the command line should execute and create the final report `hr_report.html`