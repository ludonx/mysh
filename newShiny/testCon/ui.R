
library(shiny)

shinyUI(bootstrapPage(
  selectInput("key", "Key:", LETTERS[1:5]),
  textInput("value", "Value:"),
  actionButton("save", "Save"),
  textOutput("show")
))