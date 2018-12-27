serverQuery<-
  function(input, output, session){
    observeEvent(input$do, {
      session$sendCustomMessage(type = 'testmessage',
                                message = 'Thank you for clicking')
    })
  }


