
serverLogIn<-
  function(input, output, session){
    # display for connexion tabpanel
    url <- a("Google Homepage", href="http://127.0.0.1:6922/")
    output$tab <- renderUI({
      tagList("URL link:", url)
    })
    test<- reactive({
      #a.list<-list()
      a<-"aze"
      if(a=="aze" ){
        test<-"123"
      }
      test
    })
    output$out_login <- renderText({
      paste("My login is: ", input$login)
      
    })
    
    output$out_pwd <- renderText({
      paste("My pwd is :", input$pwd)
      
    })
    
    output$res_con <- renderText({
      paste("resultat connnexion :", test())
    })
    
  }