library(shiny)

shinyUI(navbarPage("Distribution Viewer",
    tabPanel("Normal",
             sidebarLayout(
                 sidebarPanel(
                     p("Parameters for the normal distribution:"),
                     numericInput("normalMean", "Mean", value=0),
                     numericInput("normalSD", "Standard Deviation", value=1, min=0),
                     sliderInput("normalSize", "Sample Size", value=100, min=1, max=1000, step=1)
                 ),
                 mainPanel(
                     tabsetPanel(type="tabs",
                                 tabPanel("Main",
                                          plotOutput("normalPlot"),
                                          verbatimTextOutput("normalSummary"),
                                          verbatimTextOutput("normalSD")
                                          ),
                                 tabPanel("Sample",
                                          tableOutput("normalSample")
                                 )
                     )
                 )
             )
    ),
    tabPanel("Uniform",
             sidebarLayout(
                 sidebarPanel(
                     p("Parameters for the uniform distribution:"),
                     numericInput("unifMin", "Minimum", value=0),
                     numericInput("unifMax", "Maximum", value=1),
                     sliderInput("unifSize", "Sample Size", value=100, min=1, max=1000, step=1)
                 ),
                 mainPanel(
                     tabsetPanel(type="tabs",
                                 tabPanel("Main",
                                          plotOutput("unifPlot"),
                                          verbatimTextOutput("unifSummary"),
                                          verbatimTextOutput("unifSD")
                                 ),
                                 tabPanel("Sample",
                                          tableOutput("unifSample")
                                 )
                     )
                 )
             )
    ),
    tabPanel("Beta",
             sidebarLayout(
                 sidebarPanel(
                     p("Parameters for the beta distribution:"),
                     numericInput("betaS1", "Shape 1", value=1),
                     numericInput("betaS2", "Shape 2", value=1),
                     numericInput("betaNCP", "Non-Centrality Parameter", value=0),
                     sliderInput("betaSize", "Sample Size", value=100, min=1, max=1000, step=1),
                     numericInput("betaMin", "Minimum", value=0),
                     numericInput("betaMax", "Maximum", value=1)
                 ),
                 mainPanel(
                     tabsetPanel(type="tabs",
                                 tabPanel("Main",
                                          plotOutput("betaPlot"),
                                          verbatimTextOutput("betaSummary"),
                                          verbatimTextOutput("betaSD")
                                 ),
                                 tabPanel("Sample",
                                          tableOutput("betaSample")
                                 )
                     )
                 )
             )
    ),
    tabPanel("About",
             sidebarLayout(
                 sidebarPanel(
                     h1("Thank you for visiting!")
                 ),
                 mainPanel(
                     h4("Hello! This is my very first Shiny App. I hope you enjoy it!"),
                     br(),
                     p(a(href="http://rpubs.com/celsofaf/39562",
                       "Click here "), "for basic documentation written in Rstudio Presenter"),
                     p("Source code at",
                       a(href="https://github.com/celsofaf/coursera-datasci-devdataprods",
                         "my GitHub."))
                 )
             )
    )
))
