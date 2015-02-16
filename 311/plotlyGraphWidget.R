library(shiny)

graphOutput <- function(inputId, width="100%", height="550px") {
    tagList(
        singleton(tags$head(
            tags$script(src="plotlyGraphWidget.js")
        )),
        tags$iframe(id=inputId, src="https://plot.ly/~playground/7",
                    class="graphs", seamless=TRUE, width=width, height=height)
    )
}

renderGraph <- function(expr, env=parent.frame(), quoted=FALSE) {
    ## This gets called when inputs change --
    ## Place data wrangling code in here
    ## and pass the result to the client
    ## to be graphed.

    installExprFunction(expr, "func", env, quoted)

    function(){
        data = func();

        ## this function returns a list of named lists that descripe
        ## valid postMessage commands to be sent to the embedded iframe.
        ## see binding.renderValue for the receiving JS side of this function
        ## and https://github.com/plotly/Embed-API for more about the postMessage
        ## graph messages.
        ##
        ## it can also pass non-valid postMessage commands with the task "custom",
        ## which will have custom, user-provided handling code, see plotlyGraphWidget.js
        ## `parseAndRelayMessages`

        ## In this case, I couldn't figure out how JSON-ify the R data structures into a
        ## correct postMessage format, so I set up the data structure "as is" and then
        ## parsed it on the JS side after the JSON was parsed

        return(list(
            list(
                id="mychart",
                task="custom",
                data=data$message
            ),
            list(
                id="mychart",
                task="relayout",
                update=list(margin=list(b=180, t=50))
            )
        ))
    }
}
