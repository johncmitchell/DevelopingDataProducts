library(shiny)
library(pgmm)
library(ggplot2)
data(coffee)
coffee$Variety[coffee$Variety == 1] <- "Arabica"
coffee$Variety[coffee$Variety == 2] <- "Robusta"
names(coffee) <- gsub(" ", "", names(coffee))
shinyServer(
        function(input, output){
                      
         output$plot1 <- renderPlot({
                 qplot(eval(as.name(input$variable)), Caffine, xlab = input$variable, ylab = "Caffeine", color = Country, facets = . ~ Variety, data = coffee) 
         })
         output$text <- renderPrint({"This plotting tool allows the user to compare caffeine content against a number of other chemical components. Select the chemical compenant to compare and the tool will generate a plot with countries and varieties for comparison. Source: Streuli, H. (1973). Der heutige stand der kaffeechemie. In Association Scientifique International du Cafe, 6th International Colloquium on Coffee Chemisrty, Bogata, Columbia, pp. 61–72."
         })
         output$table <- renderPrint({
                 coffee
         })
        }
)
