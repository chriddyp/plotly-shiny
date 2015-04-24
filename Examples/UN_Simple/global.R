# Golbal environment contains information needed in both the ui and server scripts
# Lines 3-6 should be in all global.R scripts for shiny/plotly Apps
library(plotly)
library(shiny)
library(dplyr)

py <- plotly(username="rAPI", key="yu680v5eii", base_url="https://plot.ly")

source("plotlyGraphWidget.R")

# User Specific information:
# Load data
## In this example, data is used in both the ui and server scripts
Ideal_Point_Data <- read.csv("Data/UN_IdealPoints.csv", stringsAsFactors=F)

