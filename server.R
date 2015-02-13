shinyServer(function(input, output, session) {

    output$mychart <- renderGraph({list(
        x0=input$x0,
        x1=input$x1,
        y0=input$y0,
        y1=input$y1,
        title=input$title)
    })
})
