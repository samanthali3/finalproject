print(here::here())
here::i_am("code/03_render_report.R")

library(rmarkdown)

rmarkdown::render(
  here::here("hr_report.Rmd"),
  output_file = "hr_report.html",
  output_dir = here::here("final_report")
)