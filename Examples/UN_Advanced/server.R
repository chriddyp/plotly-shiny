#server script for United Nations Advanced Example
library(ggthemes)

shinyServer(function(input, output, session) {

  output$trendPlot <- renderGraph({
    if (length(input$name)==0) print("Please select at least one country")

    else {
      df_trend <- Ideal_Point_Data  %>%
        filter(Name %in% input$name)

      # Graph title
      if (length(input$name)>2) {
        j_names_comma <- paste(input$name[-length(input$name)], collapse = ', ')
        j_names <- paste(j_names_comma, ", and ", input$name[length(input$name)],
                         sep="")
      }

      else{
        j_names <- paste(input$name, collapse = ' and ')
      }

      graph_title  <- paste("Ideal Points for ", j_names, sep="")

      ggideal_point <- ggplot(df_trend)+
        geom_line(aes(x=Year, y=Ideal.point, by=Name, color=Name))+
        labs(x = "Year")+
        labs(y = "Ideology")+
        labs(title = graph_title)+
        scale_colour_hue("clarity",l=70, c=150)+
        theme_few()

      ggideal_point <- ggideal_point+
        theme(legend.direction = "horizontal", legend.position = "bottom")

      # Year range
      min_Year <- min(df_trend$Year)
      max_Year <- max(df_trend$Year)

      # Use gg2list() to convert from ggplot->plotly
      gg<- gg2list(ggideal_point)

      # Use Plotly syntax to further edit the plot:
      gg$layout$annotations <- NULL # Remove the existing annotations (the legend label)
      gg$layout$annotations <- list()

      # Add colored text annotations next to the end of each line
      # More about plotly annotations: https://plot.ly/r/reference/#annotation
      # Each key that we update is documented in that link above.
      for(i in 1:(length(gg$data))){ # data is a list of the lines in the graph
        gg$layout$annotations[[i]] <- list(
          text = gg$data[[i]]$name,  # The text label of the annotation, e.g. "Canada"
          font = list(color = gg$data[[i]]$line$color), # Match the font color to the line color
          showarrow = FALSE, # Don't show the annotation arrow
          y = gg$data[[i]]$y[[length(gg$data[[i]]$y)]], # set the y position of the annotation to the last point of the line
          yref = "y1", # the "y" coordinates above are with respect to the yaxis
          x = 1, # set the x position of the graph to the right hand side of the graph
          xref = "paper", # the x coordinates are with respect to the "paper", where 1 means the right hand side of the graph and 0 means the left hand side
          xanchor = "left" # position the x coordinate with respect to the left of the text
        );
      }

      gg$layout$showlegend <- FALSE # remove the legend
      gg$layout$margin$r <- 170 # increase the size of the right margin to accommodate more room for the annotation labels

      # Send this message up to the browser client, which will get fed through to
      # Plotly's javascript graphing library embedded inside the graph
      return(list(
          list(
              id="trendPlot",
              task="newPlot",
              data=gg$data,
              layout=gg$layout
          )
      ))
    }
  })

  output$termPlot <- renderPlot({
    df_term <- Ideal_Point_Data  %>%
      filter(Name %in% input$name) %>%
      group_by(Name) %>%
      summarise(terms = n())

    trans_theme <- theme(
      panel.grid.minor = element_blank(),
      panel.grid.major = element_blank(),
      panel.background = element_rect(fill=NA),
      plot.background = element_rect(fill=NA)
    )

    ggplot(df_term, aes(x=reorder(Name, terms), y=terms))+
      geom_bar(stat = "identity", fill = "#2980b9")+
      theme_bw()+
      trans_theme+
      labs(y="Terms (in years)", x="")+
      coord_flip()
  }, bg="transparent")
})
