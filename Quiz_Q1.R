setwd("C:/Users/namaksi/Documents/Data_Science/Getting and Cleaning Data/WEEK3")
getwd()

if(!file.exists("./data")) {dir.create("./data")}
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl1, destfile = "./data/Fss06hid.csv")
comm <- read.csv("./data/Fss06hid.csv")
head(comm,2)

agricultureLogical <- comm$ACR == 3 & comm$AGS == 6
head(which(agricultureLogical), 3)


##Q2
install.packages("jpeg")
library(jpeg)
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
dst2 = 'C:/Users/namaksi/Documents/Data_Science/Getting and Cleaning Data/WEEK3/q2.jpg'
download.file(fileUrl1, dst2, mode = 'wb')
data2 = readJPEG(dst2, native = TRUE)
quantile(data2, probs = c(0.3, 0.8))

##Q3
if(!file.exists("./q3")) {dir.create("./q3")}
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1, destfile = "./q3/2FGDP.csv", mode='wb')
download.file(fileUrl2, destfile = "./q3/FEDSTATS_Country.csv", mode='wb')
GDP <- read.csv("./q3/2FGDP.csv")
edu <- read.csv("./q3/FEDSTATS_Country.csv")

#names(head(GDP,2))
#head(edu,10)
#head(GDP,10)
#names(head(edu,2))

#install.packages("data.table")
#library(data.table)

install.packages("plyr")
library(plyr)


gdp_read = fread("./q3/2FGDP.csv", skip = 4, nrows = 190, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
edu_read = fread("./q3/FEDSTATS_Country.csv")

merge_tabs = merge(gdp_read, edu_read, by = "CountryCode")

nrow(merge_tabs)

arrange(merge_tabs, desc(Rank))
arrange(merge_tabs, desc(Rank))[13, Economy]