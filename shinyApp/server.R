library(shiny)

library(mongolite)


options(mongodb = list(
  "host" = "ds012345.mongolab.com:61631",
  "username" = "",
  "password" = ""
))
databaseName <- "iogold_user"
collectionName <- "utilisateurs"

saveData <- function(data) {
  # Connect to the database
  db <- mongo(collection = collectionName,
              url = sprintf(
                "mongodb://%s:%s@%s/%s",
                options()$mongodb$username,
                options()$mongodb$password,
                options()$mongodb$host,
                databaseName))
  # Insert the data into the mongo collection as a data.frame
  data <- as.data.frame(t(data))
  db$insert(data)
}

loadData <- function() {
  # Connect to the database
  db <- mongo(collection = collectionName,
              url = sprintf(
                "mongodb://%s:%s@%s/%s",
                options()$mongodb$username,
                options()$mongodb$password,
                options()$mongodb$host,
                databaseName))
  # Read all the entries
  data <- db$find()
  data
}

shinyServer(
  function(input, output, session) {
  
    # display for connexion tabpanel
    url <- a("Google Homepage", href="http://127.0.0.1:6922/")
    output$tab <- renderUI({
      tagList("URL link:", url)
    })
    
    output$out_login <- renderText({
      paste("My login is: ", input$login)
      
    })
    output$out_pwd <- renderText({
      paste("My pwd is :", input$pwd)
      
    })
    
    output$res_con <- renderText({
      paste("resultat connnexion :", input$pwd)
      
    })
    
    # for display of mtcars dataset in the "import Doc"
    output$data <- renderTable({
      mtcars
    })
    
    # for display of histogram in the "recherche"
    output$plot <- renderPlot({
      hist(mtcars$mpg, col ="blue", breaks=input$b )
    })
    
    # for display of mtcars dataset summary statistics in the "Menu analyse A page"
    output$summary <- renderPrint({
      summary(mtcars)
    })
   

  }#end function
)
