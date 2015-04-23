## Make histogram of movie ratings

## Add data
# This example is using the movies data (built into ggplot)
x = movies$rating
minx = min(x)
maxx = max(x)

shinyServer(function(input, output) {
			output$trendPlot <- renderGraph({
									#pull number of bins from the ui
									bins <- input$bins
									
									# draw the histogram with
									# the specified number of bins		
									trace1 <- list(
														x = x, 
														autobinx = FALSE, 
														xbins = list(
														start = minx, 
														end = maxx, 
														size =  ((maxx-minx)/bins)
														),  
									type = "histogram"
									)
		
					# define data
					data <- list(trace1)
					# define layout information
					layout<- list(xaxis = 
												list(title = "Ratings",
														 range = c(minx, maxx), 
														 autorange=FALSE, 
														 autotick=FALSE, 
														 tick0=minx, 
														 dtick= ((maxx-minx)/bins )))
		
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

