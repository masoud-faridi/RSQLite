library(shiny)
library(shinymanager)
credentials <- data.frame(
  user = c("shiny", "shinymanager"),
  password = c("123", "12345"),
  # password will automatically be hashed
  admin = c(TRUE, TRUE),
  stringsAsFactors = FALSE
)

# you can use keyring package to set database key
library(keyring)
#key_set("R-shinymanager-key", "obiwankenobi")
keyring::key_set_with_value("R-shinymanager-key", username = "obiwankenobi", password = "123456789")
# Init the database
create_db(
  credentials_data = credentials,
  sqlite_path = "database.sqlite", # will be created
  passphrase = key_get("R-shinymanager-key", "obiwankenobi")
  #passphrase = "passphrase_wihtout_keyring"
)

# Wrap your UI with secure_app, enabled admin mode or not
ui <- fluidPage(
  tags$h2("My secure application"),
  verbatimTextOutput("auth_output")
)
ui <- secure_app(ui, enable_admin = TRUE)


server <- function(input, output, session) {
  
  # check_credentials directly on sqlite db
  res_auth <- secure_server(
    check_credentials = check_credentials(
      "database.sqlite",
      passphrase = key_get("R-shinymanager-key", "obiwankenobi")
      # passphrase = "passphrase_wihtout_keyring"
    )
  )
  
  
  #observe({
  #  if(is.null(input$shinymanager_where) || (!is.null(input$shinymanager_where) && input$shinymanager_where %in% "application")){
      
      # your server app code
   # }
  #})
 
  
}
shinyApp(ui, server)
