## Template for server.R script for Plotly/Shiny apps

shinyServer(function(input, output, session) {
	
	## ADD DATA
	YOUR_DATA<- call_your_data_file
	
	output$trendPlot <- renderGraph({
		
		## Create your ggplot
		YOUR_PLOT <- ggplot(YOUR_DATA, YOUR_GGPLOT_SPECIFICATIONS) 
		
		## You can edit your graph with ggplot syntax here!
		
	## This function rewrites the ggplot figure in Plotly syntax
	## and returns data information (gg$data) and layout information (gg$layout) 
	gg<- gg2fig(YOUR_PLOT)
	
	## You can edit your graph with Plotly syntax here!
		
		# This sends message up to the browser client, which will get fed through to
		# Plotly's javascript graphing library embedded inside the graph
		return(list(
			list(
				id="trendPlot",
				task="newPlot",
				data=gg$data,
				layout=gg$layout
			)
		))
		
	})
	
})