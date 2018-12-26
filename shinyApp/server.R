library(shiny)

shinyServer(
  function(input, output, session) {
  
    # display for connexion tabpanel
    url <- a("Google Homepage", href="http://127.0.0.1:6922/")
    output$tab <- renderUI({
      tagList("URL link:", url)
    })
    test<- reactive({
      #a.list<-list()
      a<-"aze"
      if(a=="aze" ){
        test <- "123"
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
    
    ###########################################################################################################
    ###########################################################################################################
    # for display of mtcars dataset in the "import Doc"
    # This reactive function will take the inputs from UI.R and use them for read.table() to read the data from the file. It returns the dataset in the form of a dataframe.
    # file$datapath -> gives the path of the file
    data <- reactive({
      file1 <- input$file
      if(is.null(file1)){return()} 
      read.table(file=file1$datapath, sep=input$sep, header = input$header, stringsAsFactors = input$stringAsFactors)
      
    })
    
    # this reactive output contains the summary of the dataset and display the summary in table format
    output$filedf <- renderTable({
      if(is.null(data())){return ()}
      input$file
    })
    
    # this reactive output contains the summary of the dataset and display the summary in table format
    output$sum <- renderTable({
      if(is.null(data())){return ()}
      summary(data())
      
    })
    
    # This reactive output contains the dataset and display the dataset in table format
    output$table <- renderTable({
      if(is.null(data())){return ()}
      data()
    })
    
    # the following renderUI is used to dynamically generate the tabsets when the file is loaded. Until the file is loaded, app will not show the tabset.
    output$tb <- renderUI({
      if(is.null(data()))
        h5("Powered by", tags$img(src="RStudio-Ball.png", height=200, width=400))
      else
        tabsetPanel(tabPanel("About file", tableOutput("filedf")),tabPanel("Data", tableOutput("table")),tabPanel("Summary", tableOutput("sum")))
    })
    
    ###########################################################################################################
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
    
    ##################################
    ######## TO DO LIST PANEL ########
    ##################################
    output$tdl_text <- renderUI({
      HTML(paste("<b>Database</b>",
                 "Ajouter des catalogues de gènes à la base de données",
                 "Retirer des catalogues de gènes de la base de données",
                 "Ajouter des catalogues de MGS à la base de données",
                 "Retirer des catalogues de MGS de la base de données",
                 "Ajouter des données quantitatives à la base de données",
                 "Retirer des données quantitatives de la base de données",
                 "Ajouter un compte utilisateur",
                 "Supprimer un compte utilisateur",
                 "Modifier un compte utilisateur",
                 "Créer un projet",
                 "Supprimer un projet",
                 "Affecter un utilisateur à un projet",
                 "Retirer un utilisateur d’un projet",
                 "Ajouter des catalogues de gènes à un projet",
                 "Retirer des catalogues de gènes d’un projet",
                 "Supprimer des données de la base de données",
                 "Modifier des données existantes",
                 "Afficher les dernières modifications faites à la base de données",
                 "Faire un backup de la base de données",
                 "",
                 
                 "<b>Query</b>",
                 "Faire des recherches dans la base de données",
                 "Faire des analyses sur les données quantitatives (projets de recherche clinique)",
                 "",
                 
                 "<b>Analysis</b>",
                 "Voir le résultat d’une requête dans l’interface graphique",
                 "Voir les résultats de deux requêtes côte à côte pour les comparer",
                 "Voir les résultats de n requêtes côte à côte pour les comparer",
                 
                  sep="<br/>"))
    })

  }#end function
)





#m<- mongolite::mongo("utilisateurs","iogold_user","mongodb://localhost")
# library(mongolite)
# options(mongodb = list(
#   "host" = "localhost",
#   "username" = "",
#   "password" = ""
# ))
# databaseName <- "iogold_user"
# collectionName <- "utilisateurs"
# 
# saveData <- function(data) {
#   # Connect to the database
#   db <- mongo(collection = collectionName,
#               url = sprintf(
#                 "mongodb://%s:%s@%s/%s",
#                 options()$mongodb$username,
#                 options()$mongodb$password,
#                 options()$mongodb$host,
#                 databaseName))
#   # Insert the data into the mongo collection as a data.frame
#   data <- as.data.frame(t(data))
#   db$insert(data)
# }
# 
# loadData <- function() {
#   # Connect to the database
#   db <- mongo(collection = collectionName,
#               url = sprintf(
#                 "mongodb://%s:%s@%s/%s",
#                 options()$mongodb$username,
#                 options()$mongodb$password,
#                 options()$mongodb$host,
#                 databaseName))
#   # Read all the entries
#   data <- db$find()
#   data
# }



