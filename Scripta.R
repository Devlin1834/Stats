setwd("D:/Files/R Directory/Project")
visitors<-read.csv("visitors.csv")
temp <-read.csv("temp.csv")
fl.temp<-read.csv("fltemp.csv")
vrate<-read.csv("vrate.csv")
na.temp<-read.csv("natemp.csv")
vnt<-merge(visitors, temp, by="Year")
rnn<-merge(vrate, na.temp, by="Year")
maybe<-merge(vnt, rnn, by="Year")
maybe$NRatio<-(maybe$NA.Temp/maybe$Temp)
vxn<-lm(Visitors ~ NRatio, data=maybe)
summary(vxn)
rxn<-lm(Visit.Rate ~ NRatio, data=maybe)
summary(rxn)
