library(shiny)
library(ggplot2)
library(rpart)
data(iris)
modelfit <- rpart(Species~.,data=iris)
shinyServer(function(input,output) {
    output$prediction <- renderText({if(input$action == 0)
                                     return(NULL) 
                                     input$action 
                                     isolate(iris2 <- iris[0, ])
                                     isolate(iris2[1, ] <- c(as.numeric(input$sLengthIn),as.numeric(input$sWidthIn),
                                                             as.numeric(input$pLengthIn),as.numeric(input$pWidthIn),
                                                             as.factor("species")))
                                     isolate(pred <- predict(modelfit, iris2, type="class"))
                                     isolate(as.character(pred))})                              
    output$irisPlot <- renderPlot({
        
        g <- ggplot(iris, aes_string(input$xAxis, input$yAxis, color=input$color)) + geom_point()
        iris2 <- iris[0, ]
        iris2[1, ] <- c(as.numeric(input$sLengthIn),as.numeric(input$sWidthIn),
                        as.numeric(input$pLengthIn),as.numeric(input$pWidthIn),
                        as.factor("species"))
        g <- g + geom_point(data=iris2, color="red", size=8)
        g
    })
})