rm(list=ls())
setwd("~/Desktop/intro-biocomp")
df <- read.table("findRuns.txt", stringsAsFactors = F, header = F)
head(df)
df <- unlist(df)

r1 <- rep(0,length(df))
r1[1] <- df[1]
prev <- rep(0, length(df))
for (i in 2:length(df)){
  prev <- r1[i-1]
  if (r1 == prev){
    if (length== 1){
      length = length + 1
      start = i - 1
    }else{
      newrow = c(start, length)
      
    }
  }
}

Name <- readline(prompt = "Input name:")
 










