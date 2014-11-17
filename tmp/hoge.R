library(reshape2)
library(dplyr)
dat=read.table("res.txt", sep=",")
dat %>% head

dat$NAME = rep(c("NUMBER", "DATE", "GUEST", "KEYWORD"),640/4) 
dat %>% reshape(idvar="V1", timevar="NAME", direction = "wide") %>%
  select(-V1) %>% 
  write.table("res.txt.reshaped", quote=FALSE,col.names=FALSE,row.names=FALSE, sep=",")