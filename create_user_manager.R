library(shiny)
library(shinymanager)
library(keyring)
credentials <- data.frame(
  user = c("shiny", "shiny1"), # mandatory
  password = c("123", "1234"), # mandatory
  #start = c("2019-04-15"), # optinal (all others)
  #expire = c(NA, "2024-12-31"),
  admin = c(TRUE, FALSE),
  comment = "Simple and secure authentification mechanism 
  for single ‘Shiny’ applications.",
  stringsAsFactors = FALSE
)


#key_set("R-shinymanager-key", "obiwankenobi")
keyring::key_set_with_value("R-shinymanager-key", username = "obiwankenobi", password = "12345678")

# Init the database
if(!file.exists("www\\manager.sqlite")){
  create_db(
    credentials_data = credentials,
    sqlite_path = "www\\manager.sqlite", # will be created
    passphrase = key_get("R-shinymanager-key", "obiwankenobi")
    # passphrase = "passphrase_wihtout_keyring"
  )
}
