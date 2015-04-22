# Golbal environment contains information needed in both the ui and server scripts

library(plotly)
library(shiny)

py <- plotly(username="rAPI", key="yu680v5eii", base_url="https://plot.ly")

source("plotlyGraphWidget.R")
