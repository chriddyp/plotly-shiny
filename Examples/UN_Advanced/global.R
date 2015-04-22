# Golbal environment for both ui and server
# Include lines 3-6 in all global.R scripts
library(plotly)
library(shiny)
library(dplyr)

py <- plotly(username="rAPI", key="yu680v5eii", base_url="https://plot.ly")

source("plotlyGraphWidget.R")

# User specific info:

# In this example, the data is read in the global.r script
# because it is called in both the ui.R and server.R scripts
Ideal_Point_Data <- read.csv("Data/UN_IdealPoints.csv", stringsAsFactors=F)
Ideal_Point_Data<- Ideal_Point_Data[complete.cases(Ideal_Point_Data),]

