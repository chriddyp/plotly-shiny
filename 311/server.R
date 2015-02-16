df = read.csv('311_150k.csv') # use 311_100.csv for development, as it is much smaller
df$Created.Date <- strptime(df$Created.Date, format="%m/%d/%Y %H:%M:%S")

most_common_complaints = sort(table(df$Complaint.Type), decreasing=TRUE)

shinyServer(function(input, output, session) {


    output$mychart <- renderGraph({
        matched_complaints <- subset(df, grepl(input$search, df$Complaint.Type))
        most_common_complaints = sort(table(matched_complaints$Complaint.Type), decreasing=TRUE)

        list(
            message = c(most_common_complaints)
        )
    })
})
