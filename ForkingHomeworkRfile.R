library(tidyverse)
library(dplyr)
library(data.table)

diamonds

diamonds%>%
  select(carat,cut,price)%>%
  filter(cut == "Premium")%>%
  filter(price > 7000 & price < 10000)%>%
  arrange(desc(carat))%>%
  slice(1:20)


as.data.table(diamonds) -> diamonds
diamonds[cut == "Premium" & price > 7000 & price < 10000] -> diamonds2
diamonds2[order(-carat), .(carat, cut, price)] -> diamonds3
diamonds3[c(1:20)] -> diamonds4
diamonds4
