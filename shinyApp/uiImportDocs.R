uiImportDocs <-
  
  fluidPage(
    titlePanel("File Input"),
    sidebarLayout(
      sidebarPanel(
        fileInput("file","Upload the file"), # fileinput() function is used to get the file upload contorl option
        helpText("Default max. file size is 5MB"),
        tags$hr(),
        h5(helpText("Select the read.table parameters below")),
        checkboxInput(inputId = 'header', label = 'Header', value = FALSE),
        checkboxInput(inputId = "stringAsFactors", "stringAsFactors", FALSE),
        br(),
        radioButtons(inputId = 'sep', label = 'Separator', choices = c(Comma=',',Semicolon=';',Tab='\t', Space=''), selected = ','),
        submitButton("Actualiser") # pour valider l'importation dans le cas ou on change de separateur par exemple
      ),
      mainPanel(
        uiOutput("tb"),
        h3(getwd()),
        paste(getwd(), "/RStudio-Ball.png", sep=""),
        HTML(paste("<img src=\"./RStudio-Ball.png\"  height=\"200\" width=\"400\">"))
        # use below code if you want the tabset programming in the main panel. If so, then tabset will appear when the app loads for the first time.
        #       tabsetPanel(tabPanel("Summary", verbatimTextOutput("sum")),
        #                   tabPanel("Data", tableOutput("table")))
      )
      
    )
  )

