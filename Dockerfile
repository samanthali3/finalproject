FROM rocker/tidyverse:4.5.1 AS base

RUN apt-get update && apt-get install -y curl
RUN apt-get install -y pandoc

#Created a project directory
RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

#Created a folder in the working directory to hold all renv-associated files
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

#Changed default location of the renv cache in project directory
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

RUN Rscript -e "renv::restore(prompt = FALSE)"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######
#This is my second image!
FROM rocker/tidyverse:4.5.1
RUN mkdir -p /home/rstudio/project

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

#This is the second stage of my multi-stage build
#Copied relevant files to the proj dir in the image
COPY Makefile .
COPY hr_report.Rmd .

RUN mkdir /home/rstudio/project/code
RUN mkdir /home/rstudio/project/output
RUN mkdir /home/rstudio/project/data
RUN mkdir /home/rstudio/project/final_report

#Copied data set into the data directory in the image
COPY data/employee_performance_workload_attrition.csv data/

#Copied local code to the code dir in image's proj directory
COPY code/ /home/rstudio/project/code

#Entry point to container to create project and move it the final report directory
CMD ["sh", "-c", "make && mv hr_report.html /home/rstudio/project/final_report"]