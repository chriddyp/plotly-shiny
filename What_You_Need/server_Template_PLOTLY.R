## Template for server.R script for Plotly/Shiny apps

shinyServer(function(input, output, session) {
	
	## ADD DATA
	YOUR_DATA<- call_your_data_file_here
	
	output$trendPlot <- renderGraph({
		
		## Create your Plotly graph
		trace <- list( YOUR_TRACE_SPECIFICATIONS)
		
		# define data
		data <- list(trace)
		# define layout information
		layout<- list(YOUR_LAYOUT_SPECIFICATIONS)
		
		# This sends message up to the browser client, which will get fed through to
		# Plotly's javascript graphing library embedded inside the graph
		return(list(
			list(
				id="trendPlot",
				task="newPlot",
				data=data,
				layout=layout
			)
		))
		
	})
	
})