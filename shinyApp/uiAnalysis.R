uiAnalysis <- 
  sidebarLayout(
    sidebarPanel(
      sliderInput("b", "Select no. of BINs", min = 5, max = 20,value = 10)
    ),#end  sidebarPanel
    mainPanel(
      plotOutput("plot")
    )#end mainPanel
  )