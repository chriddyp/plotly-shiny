## embedding plotly graphs in shiny apps

These examples update Plotly graphs *client-side* through Plotly's [Embed-API](https://github.com/plotly/Embed-API)

**UN_Simple- Plotly with ggplot2**
A simplified version of a project by [@Huade](https://github.com/Huade/UN_IdealPoints)

**UN_Advance- Plotly with ggplot2**
![GIF of a Plotly graph in a Shiny App that graphs UN data](https://camo.githubusercontent.com/4e31e8bfa8dc47e9afb9c36cff375d60b12d5b57/687474703a2f2f692e696d6775722e636f6d2f6c52374e4b48742e676966)
A *fancier* version of a project by [@Huade](https://github.com/Huade/UN_IdealPoints)

**Diamonds**


**311**
![GIF of a Plotly graph in a Shiny App that filters 311 complaint calls](http://i.imgur.com/mrsarta.gif)

#### usage
each folder contains a separate app. From inside any of the folders, run
```R
library(shiny)
runApp()
```
or open runApp.R from the folder and select Run App in the top right corner.