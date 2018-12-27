serverAnalysis <-
  function(input, output, session){
    ###########################################################################################################
    # for display of histogram in the "recherche"
    output$plot <- renderPlot({
      hist(mtcars$mpg, col ="blue", breaks=input$b )
    })
    
    
    ###########################################################################################################
    ###########################################################################################################
    # for display of mtcars dataset summary statistics in the "Menu analyse A page"
    output$summary <- renderPrint({
      summary(mtcars)
    })
    
  }