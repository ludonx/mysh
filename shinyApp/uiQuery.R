uiQuery <-
sidebarLayout(position = "right",
              sidebarPanel(
                h3("Query options"),
                checkboxInput("something", label = "Something", value = FALSE),
                checkboxInput("somethingelse", label = "Something else", value = FALSE),
                checkboxInput("againsomethingelse", label = "Again something else", value = FALSE),
                actionButton("query_button", "Launch query"),
                tags$head(tags$script(src = "query-message-handler.js")),
                actionButton("do", "Click Me"),
                h3(HTML("<br>Query results")),
                h4(HTML("<br>Number of genes<br>")),
                p("140"),
                h4(HTML("<br>Number of MGS<br>")),
                p("8")
              ),#sidebarPanel
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
                  ),#end tabPanel
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
                  ),#end tabPanel
                  tabPanel("Project3",
                           titlePanel("Choose gene catalogs"),
                           checkboxInput("checkbox", label = "Project3: Genes1", value = FALSE),
                           checkboxInput("checkbox", label = "Project3: Genes2", value = FALSE),
                           checkboxInput("checkbox", label = "Project3: Genes3", value = FALSE),
                           titlePanel("Choose MGS catalogs"),
                           checkboxInput("checkbox", label = "Project3: MGS1", value = FALSE),
                           checkboxInput("checkbox", label = "Project3: MGS2", value = FALSE),
                           checkboxInput("checkbox", label = "Project3: MGS3", value = FALSE)
                           
                  )#end tabPanel
                )#end navlistPanel
              )#end MainPanel
)#end sidebarLayout