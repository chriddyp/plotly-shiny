require(lubridate)
library(ggplot2)
library(plotly)
library(plyr)

df = read.csv('311_150k.csv') # use 311_100.csv for development, as it is much smaller
# df$Created.Date <- strptime(df$Created.Date, format="%m/%d/%Y %H:%M:%S")
df$Created.Date <- strptime(df$Created.Date, "%m/%d/%Y %H:%M:%S %p")# as.POSIXct(df$Created.Date, format='%m/%d/%Y %H:%M:%S %p')

shinyServer(function(input, output, session) {


    output$aggregate <- renderGraph({
        if(input$search != "") {
            df.filtered <- subset(df, grepl(input$search, df$Complaint.Type))
        } else {
            df.filtered <- df
        }

        df.sorted <- setNames(data.frame(sort(table(df.filtered$Complaint.Type), decreasing=TRUE)), c("Complaint.Count"))
        df.sorted$Complaint.Type <- rownames(df.sorted)

        vc <- ggplot(df.sorted, aes(x=Complaint.Type, y=Complaint.Count)) + geom_bar(stat="identity")

        vcfig <- gg2fig(vc)

        vcfig$data[[1]]$x <- df.sorted$Complaint.Type
        vcfig$layout$margin$b <- "120"

        list(
            list(
                id="aggregate",
                task="newPlot",
                data=vcfig$data,
                layout=vcfig$layout
            )
        )
    })


})

gg2fig <- function(gg) {
    gg.fig <- gg2list(gg)
    gg.fig.layout <- gg.fig$kwargs$layout
    gg.fig.data <- gg.fig$""
    list(
        data=list(gg.fig.data),
        layout=gg.fig.layout
    )
}
