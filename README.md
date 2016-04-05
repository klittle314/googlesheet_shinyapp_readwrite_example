# googlesheet_shinyapp_readwrite_example
minimal read write example 
Super minimal example to read and write to a google sheet inside a shiny app

You need to have a Google Drive account and a shinyapps.io account to run the test.

You need to have a Google Sheet like the example here in your Google Drive: https://docs.google.com/spreadsheets/d/1QhPtrsukBCVZJ-t-nSxCLR1J2OCX-yVReAGVYXIzexM/edit?usp=sharing

To set up and test for failure, open the Shiny app in RStudio, install googlesheets package and in your console type library(googlesheets) gs_auth()

Run these commands in the console

options("googlesheets.httr_oauth_cache" = "gs_auth")
gskey2 <- "1QhPtrsukBCVZJ-t-nSxCLR1J2OCX-yVReAGVYXIzexM" #the key to a google sheet with two columns
gs_auth()
