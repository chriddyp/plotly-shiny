# Define UI for application that draws a histogram
shinyUI(fluidPage(
	
	# Application title
	titlePanel("Movie Ratings!"),
	
	# Sidebar with a slider input for the number of bins
	sidebarLayout(
		sidebarPanel(
			sliderInput("bins",
									"Number of bins:",
									min = 1,
									max = 50,
									value = 10)
		),
		
		# Show a plot of the generated distribution
		mainPanel(
			graphOutput("trendPlot")
		)
	)
))