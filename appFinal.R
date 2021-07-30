#Data: JohnsonJohnson quartlery earnings per share available is R datasets
#Note: I exported and re-imported the data so it saved as a dataset in my R environment
library(datasets)
ua4 <- fluidPage(
    titlePanel("Earnings Per Share: JohnsonJohnson"), 
    sidebarLayout(
        sidebarPanel(
            selectInput("quarter", "Quarter:", 
                        choices = colnames(JohnsonJohnson)
                        ),
            hr(),
            helpText("Earnings per share by quarter from JohnsonJohnson, 1960-1980")
        ),
        mainPanel(
            plotOutput("phonePlot")
        )
    )
)
library(datasets)
serv1 <- function(input, output) {
    output$phonePlot <- renderPlot({
        barplot(JohnsonJohnson[,input$quarter],
                col = 2,
                main="Quartlery Earnings Per Share (1960-1980)",
                ylab="Earning Per Share",
                xlab="Year")
        #scatter.smooth(JohnsonJohnson[,input$quarter],
         #    col = 2, 
          #   main=input$quarter)
    })
}

shinyApp(ua4, serv1)
