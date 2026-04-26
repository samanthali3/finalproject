# DATA 550 Final Project - Samantha Li

## Project Overview
This repository contains the final project for DATA 550.
The final project analyzes employee performance, workload, and attrition, with the goal being to provide insights into how employee performance relates to attrition status.
The project produces a report that includes the below in the body of the report: 

  - Table 1 - summary statistics
  - Boxplot - visual representation
  
## Structure of Repository
The file organization for this repository is as follows:

  - The `code` folder contains the R Scripts for all the code outlined in the code description.
  - The `output` folder stores all the outputs created from the code R Scripts. This folder contains a `.gitkeep` file so the empty folder appears in the GitHub repository. 
  - The `data` folder contains the csv file for the data set used.
  - The `final_report` folder is where the hr_report.html will be stored once `make` or `docker run` is run.
  - The `renv` folder stores files for activating the project library.

## Code Description
`code/01_make_table.R`
  - Creates the table_one (the code for generating the table is also here)
  - Saves the table_one as a `.rds` object in the `output/` folder

`code/02_make_box.R`
  - Creates the boxplot (the code for generating the boxplot is also here)
  - Saves the boxplot as a `.rds` object in the `output/` folder
  
`code/03_render_report.R`
  - Renders `hr_report.Rmd`
  
`hr_report.Rmd`
  - Loads the table_one and boxplot saved by the two `.R` scripts
  - Includes additional context to each of the figure included
  - Includes an introduction and conclusion to explain the context of the report
  
`Makefile`
  - Contains rules for building the final report
  - Typing `make` in the command line should execute and create the final report `hr_report.html`
  
`Dockerfile`
  - Contains rules for building a self-contained environment that can produce the final report `hr_report.html` anywhere
  
`renv.lock`
  - Lists all the packages (and versions) that are used in the project
  
## How to Build the Docker Image
The DockerHub link to the image is: https://hub.docker.com/repository/docker/samanthali3/hrfinalproj_final4.

To build locally, run `docker build -t hrfinalproj_final4 .` in the terminal.

## How to Build the Report (Docker)
To generate the final report using Docker, first make sure you are located in the project directory. Then run `make run` in the terminal.

The final report, `hr_report.html`, will be generated in the folder called `final_report/`.

## How to Build Report (Local)
  - Open the Makefile.
  - Run `make install` to synchronize the package repository.
  - Ensure the organizational structure is intact and that the output folders are empty. If they are not empty, run `make clean` in the terminal.
  - Once the library is synchronized (with the lockfile), run `make` to create the final report `hr_report.html`.
  - Navigate to `final_report/` and open the `hr_report.html` report to view.