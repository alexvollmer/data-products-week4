library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Visualizing Cars Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      uiOutput("error"),
      uiOutput("warning"),
      uiOutput("xaxis"),
      uiOutput("yaxis"),
      uiOutput("color"),
      uiOutput("shape"),
      uiOutput("size")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
