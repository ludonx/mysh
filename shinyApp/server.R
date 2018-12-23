library(shiny)



shinyServer(
  
  function(input,output){
    output$coolplot <- renderPlot({
      plot(rnorm(input$priceInput[1]))
    })
    
  }
)