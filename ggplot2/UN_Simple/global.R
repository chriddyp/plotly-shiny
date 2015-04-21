# Golbal environment contains information needed in both the ui and server scripts
library(plotly)
py <- plotly(username="rAPI", key="yu680v5eii", base_url="https://plot.ly")

# Load data
Ideal_Point_Data <- read.csv("Data/UN_IdealPoints.csv", stringsAsFactors=F)

#source should be icluded in all global scripts
source("plotlyGraphWidget.R")
