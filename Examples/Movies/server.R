# server.R
x = movies$rating
minx = min(x)
maxx = max(x)

shinyServer(function(input, output) {
			output$trendPlot <- renderGraph({
									bins <- input$bins
									trace1 <- list(x = x,
																 autobinx = FALSE,
																 xbins = list(start = minx,
																							end = maxx,
																							size =  ((maxx-minx)/bins)
																 							),
																 type = "histogram"
																 )

					data <- list(trace1)
					layout<- list(xaxis =
												list(title = "Ratings",
														 range = c(minx, maxx),
														 autorange = FALSE,
														 autotick = FALSE,
														 tick0 = minx,
														 dtick = ((maxx-minx)/bins)
												)
										)

		return(list(
					 list(id = "trendPlot",
								task = "newPlot",
								data = data,
								layout = layout
				)
		))
	})
})

