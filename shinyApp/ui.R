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
      tabPanel("Import docs",

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
      tabPanel("Research",
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

                 ))
    )#end navbarPage



)#end shinyUI
