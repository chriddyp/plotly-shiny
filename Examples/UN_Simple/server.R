#load libraries
library(ggthemes)

shinyServer(function(input, output, session) {

  output$trendPlot <- renderGraph({
    if (length(input$name)==0) print("Please select at least one country")

    else {
      df_trend <- Ideal_Point_Data  %>%
        filter(Name %in% input$name)

      ggideal_point <- ggplot(df_trend) +
        geom_line(aes(x=Year, y=Ideal.point, by=Name, color=Name)) +
        labs(x = "Year") +
        labs(y = "Ideology") +
        labs(title = "Ideal Points for Countries") +
        scale_colour_hue("clarity",l=70, c=150) + 
        theme_few()
      

      # Year range
      min_Year <- min(df_trend$Year)
      max_Year <- max(df_trend$Year)

      #This grabs data and layout information from the ggplot
      gg<- gg2fig(ggideal_point)

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
})
