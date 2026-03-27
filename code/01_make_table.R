print(here::here())
here::i_am("code/01_make_table.R")

data <- read.csv(
  file = here::here("data/employee_performance_workload_attrition.csv"), header = TRUE
)

#loading packages
library(labelled)
library(gtsummary)

#renaming variables to be consistent/look nice
var_label(data) <- list(
  department = "Department",
  projects_handled = "Projects Handled",
  performance_rating = "Performance Rating",
  attrition = "Attrition Status"
)

table_one <- data %>% 
  select("performance_rating", "attrition") %>% 
  tbl_summary(by = attrition) %>% 
  modify_spanning_header(all_stat_cols() ~ "**Attrition Status**") %>% 
  add_overall() %>% 
  add_p()

#save table to the correct folder
saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)