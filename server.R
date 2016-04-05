# tiny minimal example server.R
#corrected script to get google authorization to be correct
#see https://github.com/jennybc/googlesheets/issues/235 and https://groups.google.com/forum/#!topic/shinyapps-users/xSL6AWmtc08
#extending to read and write 
#source("global.R")
library(shiny)
library(googlesheets)
# paste(getwd())
shinyServer(function(input, output, session) {
  gs_list <- reactive({
    #Example key for my simple spreadsheet on google drive
    options("googlesheets.httr_oauth_cache" = "gs_auth")
    gskey2 <- "1QhPtrsukBCVZJ-t-nSxCLR1J2OCX-yVReAGVYXIzexM"

    gs_auth()
    # register the googlesheet
    gs_file <- gs_key(x=gskey2)
    gs_df <- gs_read(gs_file)
    gs_list <- list(gs_df,gs_file)
  })
  
  #df = gs_df

  # print table using input from Google Sheet
  output$table1 = renderDataTable(gs_list()[[1]])
  
  #write a new row of data
  output_sheet_row <- data.frame("frank","foobar")
  
  add_row <- eventReactive(input$submit, {
    gs_add_row(gs_list()[[2]], input = output_sheet_row)
  })
  #output$table1 = renderDataTable(df)
  
  # download file
  output$downloadData <- downloadHandler(
      filename = function() {
        paste('data-', Sys.Date(), '.csv', sep='')
      },
      content = function(con) {
        #write.csv(df,con)
        
        write.csv(gs_list()[[1]], con)
      }
    )
 }
)


