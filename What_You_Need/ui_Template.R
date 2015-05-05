# User interface (ui.R) template for Plotly/Shiny apps
# Add 

shinyUI(pageWithSidebar(
	
	headerPanel("ADD_YOUR_HEADER"),
	
	sidebarPanel("ADD_YOUR_SIDEBAR"),
	
	## Displays plotly graph in the main panel
	mainPanel(
		graphOutput('trendPlot')
	)
))
