# ui.R
shinyUI(fluidPage(
		titlePanel("Movie Ratings!"),
		sidebarLayout(
				sidebarPanel(
						sliderInput("bins",
												"Number of bins:",
												min = 1,
												max = 50,
												value = 10
						)
				),
		mainPanel(
					graphOutput("trendPlot")
		)
	)
))