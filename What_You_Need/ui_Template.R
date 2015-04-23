# User interface (ui.R) template for Plotly/Shiny apps

shinyUI(pageWithSidebar(
	
	headerPanel("ADD_HEADER"),
	
	sidebarPanel( ADD_SIDEBAR_INFORMATION),
	
	## Displays plotly graph in the main panel
	mainPanel(
		graphOutput('trendPlot')
	)
))