library(shiny)
library(shinydashboard)
library(DT)
library(dplyr)
choice_ui <- function(id) {
  # This ns <- NS structure creates a 
  # "namespacing" function, that will 
  # prefix all ids with a string
  ns <- NS(id)
  tagList(
    sliderInput(
      # This looks the same as your usual piece of code, 
      # except that the id is wrapped into 
      # the ns() function we defined before
      inputId = ns("choice"), 
      label = "Choice",
      min = 1, max = 10, value = 5
    ),
    actionButton(
      # We need to ns() all ids
      inputId = ns("validate"),
      label = "Validate Choice"
    )
  )
}

choice_server <- function(id) {
  # Calling the moduleServer function
  moduleServer(
    # Setting the id
    id,
    # Defining the module core mechanism
    function(input, output, session) {
      # This part is the same as the code you would put 
      # inside a standard server
      observeEvent( input$validate , {
        print(input$choice)
      })
    }
  )
}
header <- dashboardHeader()
sidebar <-dashboardSidebar(
  sidebarMenu(
    menuItem("Database",icon = icon("database"),
            
             menuSubItem("Create Tables", tabName = "menuSubItem2", icon = icon("plus-square"))
             , menuSubItem("View Tables", tabName = "menuSubItem1", icon = icon("search"))
    )
  )
)

body <-dashboardBody( tabItems(
  tabItem(tabName = "menuSubItem1", choice_ui(id="menuSubItem1UI")),
  tabItem(tabName = "menuSubItem2", h2("Create Tables"))
  
))
ui <- dashboardPage(
  dashboardHeader(title = 'LOSS PREVENTION'),
  sidebar,
  body
)
server <- function(input, output, session) {
  choice_server(id = "menuSubItem1UI")
  
}

shinyApp(ui, server)
