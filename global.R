library(shiny)
library(shinymanager)
library(keyring)

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
