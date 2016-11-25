library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Visualizing Cars Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h3("Graph Configuration"),
      p("Select a variable from the mtcars dataset for each aesthetic dimesion of the graph"),
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
