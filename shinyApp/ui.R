library(shiny)

shinyUI(
    navbarPage(
      title = "Intergromics PFA",
      
      tabPanel("Connexion",
               fluidPage(
                 titlePanel(title = " Connexion "),
                 sidebarLayout(
                   sidebarPanel(
                     textInput("login","Login",placeholder="login..."),
                     passwordInput("pwd","Password",placeholder="passeword..."),
                     submitButton("Connexion")
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
      
      tabPanel("import Doc", tableOutput("data")),#end tabPanel
      
      tabPanel("recherche",
               sidebarLayout(
                 sidebarPanel(
                   sliderInput("b", "Select no. of BINs", min = 5, max = 20,value = 10)
                 ),#end  sidebarPanel
                 mainPanel(
                   plotOutput("plot")
                 )#end mainPanel
               )
      ),#end tabPanel
      
      navbarMenu("Analyse Options",
                 tabPanel("Menu Analyse A - Summary stats", verbatimTextOutput("summary")),
                 tabPanel("Menu Analyse B - Link to code",
                          h4(HTML(paste("Thanks for watching the video. Reference code available at the following", a(href="https://github.com/aagarw30/R-Shinyapp-Tutorial/tree/master/shinylayouts/navbarpage%20demo", "link"), "."))),
                          h4(HTML(paste("In case you have questions", a(href="mailto:tekamludovik23@gmail.com", "email me"), ".")))
                          
                 ))
    )#end navbarPage
  
  
  
)#end shinyUI
