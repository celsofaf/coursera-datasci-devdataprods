library(shiny)

shinyServer(function(input, output) {
    
    normalData <- reactive({
        rnorm(input$normalSize, input$normalMean, input$normalSD)
    })
    output$normalPlot <- renderPlot({
        ifelse(input$normalSD <= 0,
               hist(0, type="n", main="ERROR: Standard Deviation must be > 0", xlab=""),
               hist(normalData(), main="Histogram of Normal Sample",
                    xlab="Values", col="orange")
        )
    })
    output$normalSummary <- renderPrint({
        summary(normalData())
    })
    output$normalSD <- renderText({
        paste("Sample standard deviation: ", sd(normalData()))
    })
    output$normalSample <- renderTable({
        data.frame(x=normalData())
    })
    
    unifData <- reactive({
        runif(input$unifSize, input$unifMin, input$unifMax)
    })
    output$unifPlot <- renderPlot({
        ifelse(input$unifMin > input$unifMax,
               hist(0, type="n", main="ERROR: you should have min <= max", xlab=""),
               hist(unifData(), main="Histogram of Uniform Sample",
                    xlab="Values", col="orange")
        )
    })
    output$unifSummary <- renderPrint({
        summary(unifData())
    })
    output$unifSD <- renderText({
        paste("Sample standard deviation: ", sd(unifData()))
    })
    output$unifSample <- renderTable({
        data.frame(x=unifData())
    })
    
    betaData <- reactive({
        input$betaMin + rbeta(input$betaSize, input$betaS1, input$betaS2, input$betaNCP) * (input$betaMax - input$betaMin)
    })
    output$betaPlot <- renderPlot({
        ifelse(input$betaS1 <= 0 || input$betaS2 <= 0,
               hist(0, type="n", main="ERROR: shape parameters must be > 0", xlab=""),
               ifelse(input$betaNCP < 0,
                      hist(0, type="n", main="ERROR: Non-Centrality Parameter must be >= 0",
                           xlab=""),
                      ifelse(input$betaMin > input$betaMax,
                             hist(0, type="n", main="ERROR: you should have min <= max", xlab=""),
                             hist(betaData(), main="Histogram of Beta Sample",
                                  xlab="Values", col="orange")
                      )
               )
        )
    })
    output$betaSummary <- renderPrint({
        ifelse(input$betaMin <= input$betaMax, summary(betaData()), "")
    })
    output$betaSD <- renderText({
        ifelse(input$betaMin <= input$betaMax, 
               paste("Sample standard deviation: ", sd(betaData())), "")
    })
    output$betaSample <- renderTable({
        data.frame(x=betaData())
    })

})