## embedding plotly graphs in shiny apps

These examples update Plotly graphs *client-side* through Plotly's [Embed-API](https://github.com/plotly/Embed-API)

**Movies - Plotly**
Simple histogram example adapted from Hello Shiny (http://glimmer.rstudio.com/shiny/01_hello/) using "Movies" data and only Plotly syntax

**UN_Simple - Plotly with ggplot2**
A simplified version of a line graph project by [@Huade](https://github.com/Huade/UN_IdealPoints). 

**UN_Advance - Plotly with ggplot2**
![GIF of a Plotly graph in a Shiny App that graphs UN data](https://camo.githubusercontent.com/4e31e8bfa8dc47e9afb9c36cff375d60b12d5b57/687474703a2f2f692e696d6775722e636f6d2f6c52374e4b48742e676966)
A *fancier* version of a line-graph project by [@Huade](https://github.com/Huade/UN_IdealPoints)

**Diamonds - Plotly with ggplot2**
ggplot2 example using the diamonds data (built into ggplot2) adapted from: https://gist.github.com/jcheng5/3239667 to work with Plotly. 

#### usage
each folder contains a separate app. From inside any of the folders, run
```R
library(shiny)
runApp()
```
or open runApp.R from the folder and select Run App in the top right corner.