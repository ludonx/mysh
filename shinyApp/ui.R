library(shiny)
source("./uiLogIn.R")
source("./uiImportDocs.R")
source("./uiQuery.R")
source("./uiAnalysis.R")
#source("ui.R")
#source("ui.R")

shinyUI(
  navbarPage(
    title = "Integromics PFA",
    
    
    ############################################# LOG IN ###################################################
    
    tabPanel("Log in",uiLogIn),#end tabPanel
    
    #############################################IMPORT DOCS###################################################
    
    tabPanel("Import docs",uiImportDocs),#end tabPanel
    
      
    ############################################# QUERY ###################################################

    tabPanel("Query",
             p("Ludo : voici trois implémentations possibles pour la sélection des catalogues. La seconde ne permet pas les choix multiples."),
             p("Je ne sais pas comment faire pour faire en sorte que la seconde permette les choix multiples."),
             p("Laquelle tu préfères ?"),
             titlePanel("Query"),
             uiQuery
    ),#end tabPanel
    
    
    ############################################# ANALYSIS ###################################################
    
    tabPanel("Analysis",
             titlePanel("Analysis"),
             uiAnalysis
    ),#end tabPanel
    ############################################# MORE ANALYSIS ###################################################

    navbarMenu("Analysis options",
               tabPanel("Menu Analyse A - Summary stats", verbatimTextOutput("summary")),
               tabPanel("Menu Analyse B - Link to code",
                        h4(HTML(paste("Thanks for watching the video. Reference code available at the following", a(href="https://github.com/aagarw30/R-Shinyapp-Tutorial/tree/master/shinylayouts/navbarpage%20demo", "link"), "."))),
                        h4(HTML(paste("In case you have questions", a(href="mailto:tekamludovik23@gmail.com", "email me"), ".")))
                        
               )
    ), #end navbarMenu
    
    #TO DO LIST
    #Will have to be removed once everything here is done
    
    
    tabPanel("To do list",
             titlePanel("To do list"),
             htmlOutput("tdl_text")
    )#end to do list
  )
  #end navbarPage



)#end shinyUI


