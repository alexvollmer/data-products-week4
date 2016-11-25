library(shiny)
library(datasets)
library(ggplot2)

shinyServer(function(input, output) {
  columns <- c("", colnames(mtcars))

  output$xaxis <- renderUI(
    selectInput("xaxis", "Select a x-axis value",
                choices = columns, selected = NULL, multiple = FALSE))

  output$yaxis <- renderUI({
    req(input$xaxis)
    yaxis_columns <- columns[columns != input$xaxis]
    selectInput("yaxis", "Select a y-axis value", choices = yaxis_columns)
  })

  output$color <- renderUI({
    req(input$yaxis)
    color_columns <- columns[!columns %in% c(input$xaxis, input$yaxis)]
    selectInput("color", "Select a color value", choices = color_columns)
  })

  output$shape <- renderUI({
    req(input$color)
    shape_columns <- columns[!columns %in% c(input$xaxis, input$yaxis, input$color)]
    selectInput("shape", "Select a shape value", shape_columns)
  })

  output$size <- renderUI({
    req(input$shape)
    size_columns <- columns[!columns %in% c(input$xaxis, input$yaxis, input$color, input$shape)]
    selectInput("size", "Select a size value", size_columns)
  })

  output$distPlot <- renderPlot({
    req(input$xaxis, input$yaxis, input$color, input$shape, input$size)

    tryCatch({
      ggplot(mtcars, aes(x=mtcars[[input$xaxis]],
                         y=mtcars[[input$yaxis]],
                         color=mtcars[[input$color]],
                         size=mtcars[[input$size]],
                         shape=as.factor(mtcars[[input$shape]]))) +
        geom_point()
    }, error = function(e) {
      output$error <- renderText(e)
    }, warning = function(w) {
      output$warning <- renderText(w)
    })
  })

})
