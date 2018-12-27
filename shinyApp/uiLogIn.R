
uiLogIn<-
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
