# Start your code here!
library(tidyverse)

women_results <- read.csv("women_results.csv")
men_results <- read.csv("men_results.csv")

men_filtered <- men_results %>%
          filter(tournament == "FIFA World Cup", date > "2002-01-01") %>%
          mutate(goals_scored = home_score + away_score)

women_filtered <- women_results %>%
          filter(tournament == "FIFA World Cup", date > "2002-01-01") %>%
          mutate(goals_scored = home_score + away_score)

women_filtered <- women_filtered %>%
  mutate(goals_scored = home_score + away_score)

men_filtered <- men_filtered %>%
  mutate(goals_scored = home_score + away_score)

test_results <- wilcox.test(
  x = women_filtered$goals_scored,
  y = men_filtered$goals_scored,
  alternative = "greater"
)

p_val <- round(test_results$p.value, 4)
result <- ifelse(p_val <= 0.01, "reject", "fail to reject")


result_df <- data.frame(p_val, result)
