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
  db <- mongolite::mongo(collection = collectionName,
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


shinyServer(function(input, output) {
  
  key <- reactive({
    paste(input$key, "data", sep = ".")
  })
  
  output$show <- renderText({
    
    m <- mongo.create()
    if (mongo.is.connected(m)) {
      res <- mongo.find.one(m, key())
      mongo.disconnect(m)
    }
    
    if (!is.null(res))
      mongo.bson.value(res, "data")
  })
  
  observe({
    if (input$save == 0)
      return()
    
    isolate({
      m <- mongo.create()
      if (mongo.is.connected(m)) {
        mongo.insert(m, key(), list(data = input$value))
        mongo.disconnect(m)
      }
    })
  })
})