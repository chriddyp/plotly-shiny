shinyServer(function(input, output, session) {
	
	dataset <- reactive({
	diamonds[sample(nrow(diamonds), input$sampleSize),]
	})
	
	output$trendPlot <- renderGraph({
		
		p <- ggplot(dataset(), 
								aes_string(x = input$x, 
													 y = input$y)) + 
				 geom_point() 
		
		p <- p +	 theme(legend.position= c(1,1),
							 			 legend.background= element_rect(fill="transparent"))
		
		if (input$color != 'None')
				p <- p + aes_string(color=input$color)
		
		facets <- paste(input$facet_row, '~', input$facet_col)
		if (facets != '. ~ .')
				p <- p + facet_grid(facets)
			
		gg <- gg2fig(p)
		
		# Send this message up to the browser client, which will get fed through to
		# Plotly's javascript graphing library embedded inside the graph
		return(list(
			list(
				id = "trendPlot",
				task = "newPlot",
				data = gg$data,
				layout= gg$layout
			)
		))
		
	})
	
})