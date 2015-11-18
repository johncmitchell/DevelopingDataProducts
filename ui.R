library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Coffee Caffeine by Variable"),
        sidebarPanel(
                h3('Selections'),
                selectInput("variable", "Chemical Component:",
                            list("ph Value" = "phValue", 
                                 "Mineral Content" = "MineralContent",
                                 "Water" = "Water",
                                 "Bean Weight" = "BeanWeight",
                                 "Fat" = "Fat",
                                 "Free Acid" = "FreeAcid",
                                 "Trigonelline" = "Trigonelline",
                                 "Chlorogenic Acid" = "ChlorogenicAcid",
                                 "Neochlorogenic Acid" = "NeochlorogenicAcid",
                                 "Isochlorogenic Acid" = "IsochlorogenicAcid"))
        ),
        mainPanel(
                h3('Caffeine Comparison'),
                tabsetPanel(
                        tabPanel("Plot", plotOutput("plot1")), 
                        tabPanel("Table", verbatimTextOutput("table")), 
                        tabPanel("Help", verbatimTextOutput("text"))
                )
        )    
))


