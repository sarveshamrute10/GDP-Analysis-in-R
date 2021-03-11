library(readr)
library(tidyverse)
library(directlabels)
library(png)
library(grid)
data <- read_csv("S:\\R\\DS Home Assg\\UNdata_Export_20201117_190536867.csv")
library(dplyr)
newdata <- filter(data, Item=="Gross Domestic Product (GDP)" & Year %in% c("1970","1980","1990","2000","2010","2018") & Country %in% c("Albania","Australia","Benin","Gabon","Equatorial Guinea"))
newdata <- mutate(newdata, Value1 = Value/1e+09)
library(ggplot2)
p <- ggplot(newdata,aes(Value1,Country)) + geom_line() + scale_x_continuous(breaks=seq(0,10000,2000),limits=c(0,10000)) + 
  labs(title="GDP vs Country (1970 - 2018)",x="Gross Domestic Product (GDP) in Billion",y="Country")
library(gganimate) 
theme_set(theme_bw())
library(transformr)
p

