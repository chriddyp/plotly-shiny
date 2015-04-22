#This script is necessary in the app folder 
#but the user should not have to edit it

#Output Graph Function
graphOutput <- function(inputId, width="100%", height="550px") {
    tagList(
        singleton(tags$head(
            tags$script(src="plotlyGraphWidget.js")
        )),
       tags$iframe(id=inputId, src="https://plot.ly/~playground/7.embed",
       class="graphs", style="border:none;", seamless=TRUE, width=width, height=height)
    )
}

#Function to change ggplot figure into plotly syntax
#gg is the users ggplot
#called in the server script to return data and layout info separately 
gg2fig <- function(gg) {
	fig <- gg2list(gg)
	data <- list()
	for(i in 1:(length(fig)-1)){data[[i]]<-fig[[i]]}
	layout <- fig$kwargs$layout
	result <- list(data=data,layout=layout)
	return(result)
} 

renderGraph <- function(expr, env=parent.frame(), quoted=FALSE) {
    ## This gets called when inputs change --
    ## Place data wrangling code in here
    ## and pass the result to the client
    ## to be graphed.

	
	installExprFunction(expr, "func", env, quoted)
    
    

    function(){
        data = func();
        ## data is the state of the widgets: see server.R
        ## this function returns a list of named lists that descripe
        ## valid postMessage commands to be sent to the embedded iframe.
        ## see binding.renderValue for the receiving JS side of this function
        ## and https://github.com/plotly/Embed-API for more about the postMessage
        ## graph messages
        return(data)
 
    }
}
