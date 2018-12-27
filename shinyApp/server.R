library(shiny)
source("./serverLogIn.R")
source("./serverImportDocs.R")
source("./serverQuery.R")
source("./serverAnalysis.R")



shinyServer(
  function(input, output, session) {
    
    ############################################# LOG IN ###################################################
    
    serverLogIn(input, output, session)
    
    ######################################## IMPORT DOCS#####################################################
    
    serverImportDocs(input, output, session)
    
    
    ######################################## QUERY PANEL ##############################################

    serverQuery(input, output, session)
    
    ######################################## ANALYSIS ##############################################
    
    serverAnalysis(input, output, session)
    
    
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




