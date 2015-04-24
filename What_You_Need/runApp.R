# runApp.R template for Plotly/Shiny apps
# open this script in R and select 

install.packages("shiny")
install.packages("dplyr")
install.packages("devtools")

library("devtools")
install_github("ropensci/plotly")

shiny::runApp()