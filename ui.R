#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinymanager)

########  sources

source(file="ui_global_variables.R",local = TRUE)
source(file="ui_global_functions.R",local = TRUE)


###########################
# (1) dashboardHeader start
########################
header <- dashboardHeader(
  
 
)
###########################
# (1) dashboardHeader end
###########################
###########################




########################
# dashboardSidebar 1 start
########################
sidebar <- 
  dashboardSidebar(
    
    collapsed = TRUE, 
    div(htmlOutput("welcome"), style = "padding: 20px"),
    sidebarMenu(
      # menuItem database 1
      menuItem(ui_global_variable$mI_1_0$name ,icon = icon("database"),
               menuSubItem(ui_global_variable$mI_1_1$name, tabName = ui_global_variable$mI_1_1$ID, icon = icon("search")),
               menuSubItem(ui_global_variable$mI_1_2$name, tabName = ui_global_variable$mI_1_2$ID, icon = icon("plus-square")),
               menuSubItem(ui_global_variable$mI_1_3$name, tabName = ui_global_variable$mI_1_3$ID, icon = icon("exchange-alt")),
               menuSubItem(ui_global_variable$mI_1_4$name, tabName = ui_global_variable$mI_1_4$ID, icon = icon("edit")),
               menuSubItem(ui_global_variable$mI_1_5$name, tabName = ui_global_variable$mI_1_5$ID, icon = icon("trash-alt")),
               menuSubItem(ui_global_variable$mI_1_6$name, tabName = ui_global_variable$mI_1_6$ID, icon = icon("info-circle"))
      )
    ,
    # menuItem analysis 2
    menuItem(ui_global_variable$mI_2_0$name ,icon = icon("database"),
             menuSubItem(ui_global_variable$mI_2_1$name, tabName = ui_global_variable$mI_2_1$ID, icon = icon("search")),
             menuSubItem(ui_global_variable$mI_2_2$name, tabName = ui_global_variable$mI_2_2$ID, icon = icon("plus-square")),
             menuSubItem(ui_global_variable$mI_2_3$name, tabName = ui_global_variable$mI_2_3$ID, icon = icon("exchange-alt")),
             menuSubItem(ui_global_variable$mI_2_4$name, tabName = ui_global_variable$mI_2_4$ID, icon = icon("edit")),
             menuSubItem(ui_global_variable$mI_2_5$name, tabName = ui_global_variable$mI_2_5$ID, icon = icon("trash-alt")),
             menuSubItem(ui_global_variable$mI_2_6$name, tabName = ui_global_variable$mI_2_6$ID, icon = icon("info-circle"))
    )
    )
    
  )

########################
# dashboardSidebar 1 end
########################
########################


########################
# dashboardBody start
########################
body <-dashboardBody( tabItems(
  
  # menuItem_database
  tabItem(tabName = "UI_ID_menuItem_database_tabName_search", uiOutput("UI_ID_menuItem_database_tabName_search_UI")),
  tabItem(tabName = "UI_ID_menuItem_database_tabName_create_table", uiOutput("UI_ID_menuItem_database_tabName_create_table_UI")),
  tabItem(tabName = "UI_ID_menuItem_database_tabName_update_table", uiOutput("UI_ID_menuItem_database_tabName_update_table_UI")),
  tabItem(tabName = "UI_ID_menuItem_database_tabName_insert_value", uiOutput("UI_ID_menuItem_database_tabName_insert_value_UI")),
  tabItem(tabName = "UI_ID_menuItem_database_tabName_del_table", uiOutput("UI_ID_menuItem_database_tabName_del_table_UI")),
  tabItem(tabName = "UI_ID_menuItem_database_tabName_about", uiOutput("UI_ID_menuItem_database_tabName_about_UI")),
  
  # menuItem_database
  tabItem(tabName = "UI_ID_menuItem_analysis_tabName_search", uiOutput("UI_ID_menuItem_analysis_tabName_search_UI")),
  tabItem(tabName = "UI_ID_menuItem_analysis_tabName_create_table", uiOutput("UI_ID_menuItem_analysis_tabName_create_table_UI")),
  tabItem(tabName = "UI_ID_menuItem_analysis_tabName_update_table", uiOutput("UI_ID_menuItem_analysis_tabName_update_table_UI")),
  tabItem(tabName = "UI_ID_menuItem_analysis_tabName_insert_value", uiOutput("UI_ID_menuItem_analysis_tabName_insert_value_UI")),
  tabItem(tabName = "UI_ID_menuItem_analysis_tabName_del_table", uiOutput("UI_ID_menuItem_analysis_tabName_del_table_UI")),
  tabItem(tabName = "UI_ID_menuItem_analysis_tabName_about", uiOutput("UI_ID_menuItem_analysis_tabName_about_UI"))
  
  
  
))
########################
# dashboardBody end
########################
########################




##########################################
##########################################
##########################################  
##########################################
##########################################
##########################################
#shinyUI(
#secure_app(
  ####################################
  ####################################
  ########## START shinyUI ###########
  ########## START shinyUI ###########
  ####################################
  
  
ui<-  dashboardPage(header, sidebar, body)
  
  
  ####################################
  ########## END shinyUI #############
  ########## END shinyUI #############
  ####################################
#shinyUI(
secure_app(ui, enable_admin = TRUE)  
##########################################
##########################################
##########################################
##########################################
##########################################
##########################################