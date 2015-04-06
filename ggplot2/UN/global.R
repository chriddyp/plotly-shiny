# Golbal environment for both ui and server
library(dplyr)

# Load data
UN <- read.csv("Data/UN_IdealPoints.csv", stringsAsFactors=F)
UN <- UN[complete.cases(UN),]

Ideal_Point_Data <- UN

source("plotlyGraphWidget.R")
