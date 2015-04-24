#Shiny
shinyServer(function(input, output, session) {
	
	#add reactive data information. Dataset = built in diamonds data
	dataset <- reactive({
	diamonds[sample(nrow(diamonds), input$sampleSize),]
	})
	
	output$trendPlot <- renderGraph({
	
		# build graph with ggplot syntax
		# pull x and y variable info
		p <- ggplot(dataset(), 
								aes_string(x = input$x, 
													 y = input$y)) + 
				 geom_point() 
		
		# if statements for possible color/facet row/facet column variables
		if (input$color != 'None')
				p <- p + aes_string(color=input$color)
		
		facets <- paste(input$facet_row, '~', input$facet_col)
		if (facets != '. ~ .')
				p <- p + facet_grid(facets)
		
		# convert from ggplot->plotly
		gg <- gg2fig(p)
		
		# make edits with plotly syntax
		gg$layout <- list(legend = list(
															x = 1, 
															y = 1, 
															bgcolor = "transparent"))
		
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