# Datacamp R Analyst Career Path Notes
# 23. April 2020
########################################################################################
# 1 INTRODUCTION TO R
########################################################################################
# VARIABLES: numeric, character, logical
# VECTORS: c(1,2,3) ; names(...) ; sum(...); c(1,2,3,4), result(selection>0)
# MATRIX: Elements of the same data type
# matrix(vectors, byrow = TRUE, nrow = 3)
# colnames(mymatrix) <- vector --> same for rownames
# rowsums(), colsums()
# cbind
# FACTOR: used for categorial variables
# factor(temperature,order=TRUE,levels=c("low","mid","high"))
# summary()
# DATAFRAMES: collections of data, each variable same type of data
# LIST: variety of data under one name list(obect 1, object 2)
########################################################################################
# 2 INTRODUCTION TO TYDIVERSE
########################################################################################
# Dataset is gapminder
library(gapminder)
library(dplyr)
library(ggplot2)

# Subset the dataset by using %>% PIPES and VERBS
# filter()
gapminder %>% filter(year==2007)
# arrange() --> sorts the data
gapminder %>% arrange(desc(gdpPercap))
# mutate() --> change existing variable into a new one
gapminder %>% mutate(gdp=gdpPercap*pop) #introduces a new column with this variable

# 3 GGPLOT2 and dplyr summarize()
# summarize() --> many row into one togehter with group_by()
gapminder %>% group_by(year,continent) %>% summarize(totalpop = as.numeric(sum(pop)),
                                                     meanlifeExp=mean(lifeExp))
# visualizing data --> save it to object
by_year_continent <- gapminder %>% group_by(year,continent) %>% summarize(
  totalpop = as.numeric(sum(pop)), meanlifeExp=mean(lifeExp))

ggplot(by_year_continent, aes(x=totalpop,y=meanlifeExp, color=continent)) + geom_point() + expand_limits(y=0)+
  scale_x_log10()
########################################################################################
# 3  INTRODUCTION TO IMPORTING DATA IN R
########################################################################################
# Importing data in R: csv read.csv()
# Flat files (csv), Excel, Databases, Web, Statistical software
# into dataframe
# read.csv("states.csv", stringAsFactors = FALSE)
# use path <- file.path("~", "datasets","states.csv)
# stringsAsFactors = FALSE --> state names are not categorial
# print str(df) to se structure of the data
#
# tab-delimited data read.delim("states.txt", stringAsFactors=FALSE)
# Exotic file format read.table("states.txt", header = TRUE, sep = "/", stringsAsFactors=FALSE)
# read.delim("my_file.txt", colClasses = c("character","numeric","logical"))
# read.table is the main function --> read.csv is just other default defaults!
# Specific R package: "readr"
install(readr) # imports data as "tibbles"
# read_csv("states.csv")
# read_delim() is the same function in the package as read_table() --> Main function
# read_delim("states", delim="/")
# this package guesses the data type on the 30 first observations
install("data.table")
library(data.table)
# this package is for speed with huge data files
# fread("data.csv") --> knows column types and separators and its fast
# fread("path/to/file.txt", drop = 2:4)
# fread("path/to/file.txt", select = c(1, 5))
# fread("path/to/file.txt", drop = c("b", "c", "d"))
#fread("path/to/file.txt", select = c("a", "e"))
install("readxl")
library(readxl)
# excel_sheets("cities.xlsx) --> gets the sheet names
# read_excel("cities.xlsx") --> imports the sheets
# This imports all sheets with lapply function:
# my_workbook <- lapply(excel_sheets("data.xlsx"),read_excel,path = "data.xlsx")
# install("gdata") --> alternative to readxl
library("XLConnect")
# XLConnect --> Working with Excel through R / Bridge between Excel
# Issue: uses Java
# book <- loadWorkbook("file.xlsx")
########################################################################################
# 4  INTERMEDIATE IMPORTING DATA IN R
########################################################################################
# 


