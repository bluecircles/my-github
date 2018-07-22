#
library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
 
# Graph 
  output$graph1 <- renderPlot({
      ggplot(data = trees, aes(x= trees$Height, y=trees$Volume)) +
      geom_point(aes(color=Girth), size =4) +
      ggtitle("Height and Volume from the Trees data set") +
      xlab("Height") +
      ylab("Volume") +
      theme(legend.position = "right") 

  })

# Table  
  output$table1 <- renderDataTable({
    summary(trees)
  })
  
# Regression
  modelfit <- lm(Height ~ Volume + Girth, data = trees)
  
  pred1 <- reactive({
    inputGirth <- input$Girth
    inputVolume <- input$Volume   
    
     predict(modelfit, newdata = data.frame(Volume = inputVolume, Girth = inputGirth))
  })

  originalG <- reactive({
    input$Girth
  })
  
  originalV <- reactive({
    input$Volume
  })
  
# Render the results

  output$originalG <- renderText({originalG()})
  output$originalV <- renderText({originalV()})
  output$pred1 <- renderText({ pred1()})
 
})
