library(shiny)

shinyUI(
  fluidPage(
  
    titlePanel(title = " Connexion "),
    
    textInput("login","Login",placeholder="login..."),
    passwordInput("mdp","Password",placeholder="passeword..."),
    actionButton("connexion","Connexion"),
    br(),
    
    sidebarLayout(
      sidebarPanel(
        sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
        radioButtons("typeInput", "Product type",
                     choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                     selected = "WINE"),
        selectInput("countryInput", "Country",
                    choices = c("CANADA", "FRANCE", "ITALY"))
      ),
      
      mainPanel(
        plotOutput("coolplot"),
        br(), br(),
        tableOutput("results")
      )
    )
  )
  
  
)