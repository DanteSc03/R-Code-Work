# Start your code here!
library(tidyverse)

women_results <- read.csv("women_results.csv")
men_results <- read.csv("men_results.csv")

women_filtered <- women_results[as.Date(women_results$date) >= as.Date("2002-01-01"), ]
men_filtered <- men_results[as.Date(men_results$date) >= as.Date("2002-01-01"), ]

women_filtered <- women_filtered %>%
  mutate(goals_scored = home_score + away_score)

men_filtered <- men_filtered %>%
  mutate(goals_scored = home_score + away_score)

t_test_result <- t.test(women_filtered$goals_scored, men_filtered$goals_scored, alternative = "greater", var.equal = TRUE)

p_val <- t_test_result$p.value
result <- ifelse(p_val <= 0.10, "reject", "fail to reject")

result_df <- data.frame(p_val, result)
