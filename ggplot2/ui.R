shinyUI(fluidPage(
  tags$h2("NYC 311 Complaints"),
  tags$h4("Plotly and Shiny"),
  fluidRow(
      column(
        width=4,
        textInput("search", "Search complaints")
      )
  ),
  fluidRow(
    column(width=12,
      graphOutput("aggregate")
    )
  )
))
