library(shiny)

shinyUI(
    navbarPage(
      title = "Integromics PFA",
      
      tabPanel("Log in",
               fluidPage(
                 titlePanel(title = " Log in "),
                 sidebarLayout(
                   sidebarPanel(
                     textInput("login","Login",placeholder="Login..."),
                     passwordInput("pwd","Password",placeholder="Password..."),
                     submitButton("Log in")
                   ),#end  sidebarPanel
                   mainPanel(
                     textOutput("out_login"),
                     textOutput("out_pwd"),
                     tableOutput("tab"),
                     textOutput("res_con")
                   )#end mainPanel
                   
                 )#end sidebarLayout
               )#end fluidPage
               
               ),#end tabPanel 
      
      ###########################################################################################################
      ###########################################################################################################
      tabPanel("Database",
               
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
                     uiOutput("tb")
                     
                     # use below code if you want the tabset programming in the main panel. If so, then tabset will appear when the app loads for the first time.
                     #       tabsetPanel(tabPanel("Summary", verbatimTextOutput("sum")),
                     #                   tabPanel("Data", tableOutput("table")))
                   )
                   
                 )
               )
               
               ),#end tabPanel
      
      
      ###########################################################################################################
      ###########################################################################################################
      tabPanel("Query",
               p("Ludo : voici trois implémentations possibles pour la sélection des catalogues. La seconde ne permet pas les choix multiples."),
               p("Je ne sais pas comment faire pour faire en sorte que la seconde permette les choix multiples."),
               p("Laquelle tu préfères ?"),
               titlePanel("Query"),
               
               sidebarLayout(position = "right",
                 sidebarPanel(
                   h1("Checkboxes go here"),
                   h1("Button goes here"),
                   h3(HTML("Query results")),
                   h4(HTML("<br>Number of genes<br>")),
                   p("140"),
                   h4(HTML("<br>Number of MGS<br>")),
                   p("8")
                 ),
                 mainPanel(
                   
                   navlistPanel(
                     "Choose a project",
                     tabPanel("Project1",
                              selectInput("genes_cat", "Choose gene catalogs",
                                          list(`Project 3 gene catalogs a` = c("Gene catalog 1", "Gene catalog 2", "Gene catalog 3"),
                                               `Project 3 gene catalogs b` = c("Gene catalog 4", "Gene catalog 5", "Gene catalog 6"),
                                               `Project 3 gene catalogs c` = c("Gene catalog 7", "Gene catalog 8", "Gene catalog 9")),
                                          multiple = TRUE
                              ),
                              selectInput("mgs_cat", "Choose MGS catalogs:",
                                          list(`Project 3 MGS catalogs a` = c("MGS catalog 1", "MGS catalog 2", "MGS catalog 3"),
                                               `Project 3 MGS catalogs b` = c("MGS catalog 4", "MGS catalog 5", "MGS catalog 6"),
                                               `Project 3 MGS catalogs c` = c("MGS catalog 7", "MGS catalog 8", "MGS catalog 9")),
                                          multiple = TRUE
                              )
                     ),
                     tabPanel("Project2",
                              navlistPanel(
                                "Choose gene catalogs",
                                tabPanel("Project2: Genes1",
                                         h3("1")
                                ),
                                tabPanel("Project2: Genes2",
                                         h3("2")
                                ),
                                tabPanel("Project2: Genes3",
                                         h3("3")
                                )
                              ),
                              navlistPanel(
                                "Choose MGS catalogs",
                                tabPanel("Project2: MGS1",
                                         h3("4")
                                ),
                                tabPanel("Project2: MGS2",
                                         h3("5")
                                ),
                                tabPanel("Project2: MGS3",
                                         h3("6")
                                )
                              
                     )
                   ),
                   tabPanel("Project3",
                            titlePanel("Choose gene catalogs"),
                            checkboxInput("checkbox", label = "Project3: Genes1", value = FALSE),
                            checkboxInput("checkbox", label = "Project3: Genes2", value = FALSE),
                            checkboxInput("checkbox", label = "Project3: Genes3", value = FALSE),
                            titlePanel("Choose MGS catalogs"),
                            checkboxInput("checkbox", label = "Project3: MGS1", value = FALSE),
                            checkboxInput("checkbox", label = "Project3: MGS2", value = FALSE),
                            checkboxInput("checkbox", label = "Project3: MGS3", value = FALSE)
                            
                   )
                   )
                 )
               )
      ),#end tabPanel
      
      ###########################################################################################################
      ###########################################################################################################
      tabPanel("Analysis",
               titlePanel("Analysis"),
               sidebarLayout(
                 sidebarPanel(
                   sliderInput("b", "Select no. of BINs", min = 5, max = 20,value = 10)
                 ),#end  sidebarPanel
                 mainPanel(
                   plotOutput("plot")
                 )#end mainPanel
               )
      ),#end tabPanel
      ###########################################################################################################
      ###########################################################################################################
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

