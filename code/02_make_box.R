print(here::here())
here::i_am("code/02_make_box.R")

data <- read.csv(
  file = here::here("data/employee_performance_workload_attrition.csv"), header = TRUE
)

#creating a boxplot
library(ggplot2)

boxplot <- ggplot(data, aes(x = attrition, y = performance_rating, fill = attrition))+
  geom_boxplot()+
  scale_fill_manual(values = c("Yes" = "lightblue",
                               "No" = "mistyrose"))+
  labs(title = "Performance Rating by Attrition Status",
       x = "Attrition Status",
       y = "Performance Rating")

#save boxplot to the correct folder
saveRDS(
  boxplot,
  file = here::here("output/boxplot.rds")
)