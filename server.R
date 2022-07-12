#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
keyring::key_set_with_value("R-shinymanager-key", username = "obiwankenobi", password = "12345678")
# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
  
  # call the server part
  # check_credentials returns a function to authenticate users
  res_auth <- secure_server(
    check_credentials = check_credentials(
      db="www\\manager.sqlite",
      passphrase = key_get("R-shinymanager-key", "obiwankenobi")
      # passphrase = "passphrase_wihtout_keyring"
    )
  )
 
  

})
