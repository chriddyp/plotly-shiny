## embedding plotly graphs in shiny apps

these examples update Plotly graphs *client-side* through Plotly's [Embed-API](https://github.com/plotly/Embed-API)

**UN - Plotly with ggplot2**
![GIF of a Plotly graph in a Shiny App that graphs UN data](https://camo.githubusercontent.com/4e31e8bfa8dc47e9afb9c36cff375d60b12d5b57/687474703a2f2f692e696d6775722e636f6d2f6c52374e4b48742e676966)
A project by [@Huade](https://github.com/Huade/UN_IdealPoints)

**311**
![GIF of a Plotly graph in a Shiny App that filters 311 complaint calls](http://i.imgur.com/mrsarta.gif)

**simple**
![Screenshot of a Plotly Shiny App](http://i.imgur.com/oscZtEi.png)

#### usage
each folder contains a separate app. From inside any of the folders, run
```R
library(shiny)
runApp()
```
