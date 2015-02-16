shinyUI(fluidPage(
  tags$h2("filtering 150k 311 complaints with plotly and shiny"),
  fluidRow(
    column(width=3,
      textInput(
        "search",
        "search complaints",
        ''
      )
    )
  ),
  fluidRow(
    column(width=12,
      graphOutput("mychart")
    )
  )
))
