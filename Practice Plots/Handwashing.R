# Imported libraries
library(tidyverse)
library(ggplot2)
library(dplyr)

#Code
yearly <- read.csv("data/yearly_deaths_by_clinic.csv")
monthly <- read.csv("data/monthly_deaths.csv")

yearly$proportion_deaths <- yearly$deaths/yearly$births
monthly$proportion_deaths <- monthly$deaths/monthly$births


ggplot(yearly, aes(x=year, y=proportion_deaths, color=clinic)) +
	geom_line()

ggplot(monthly, aes(x=year, y=proportion_deaths, color=clinic))+
	geom_line()

monthly$handwashing_started <- as.Date(monthly$date) >= as.Date("1847-06-01")

monthly_summary <- monthly %>%
  group_by(handwashing_started) %>%
  summarize(mean_proportion_deaths = mean(proportion_deaths))

monthly_summary
