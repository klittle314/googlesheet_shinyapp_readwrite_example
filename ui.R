
#tiny inimal example ui

shinyUI(fluidPage(
  
  titlePanel("GoogleSheet Download"),
  
  sidebarLayout(
    
    sidebarPanel(
      helpText("Test of reading and writing data from/to a Google sheet"),
      downloadButton('downloadData', 'Download'),
      actionButton(
        inputId = "submit",
        label   = "Add a row"),
      width=3
      
    ),
    
    mainPanel(
      h2('Fruit Available'), hr(),
      dataTableOutput('table1')
      
    )
  )
 )
)


  
  
  



