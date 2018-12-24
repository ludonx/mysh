library(shiny)

shinyUI(
  fluidPage(

    titlePanel(title = " Connexion "),



    sidebarLayout(
      sidebarPanel(
        textInput("login","Login",placeholder="login..."),
        passwordInput("pwd","Password",placeholder="passeword..."),
        submitButton("Connexion")
      ),

      mainPanel(

        textOutput("outlogin"),
        textOutput("outpwd"),
        tableOutput("tab")
      )
    )
  )

)
