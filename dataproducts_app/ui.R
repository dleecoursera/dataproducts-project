library(shiny)
data(iris)
shinyUI(pageWithSidebar(
    headerPanel("Iris predictor"),
    sidebarPanel(
             h3("Usage:"),
             h5("1. The main panel shows a plot of the iris dataset. The radio buttons on the sidebar 
                can be used to change the axes and colouring displayed on the plot."), 
             h5("2. You can also input a set of values in the text
                fields below the plot; the plot will update to display your input
                as a data point."), 
             h5("3. The 'Predict' button below the text fields will
                classify the new data point according to a simple tree model, and
                a prediction of the new point's species will be shown."),
             h3("Display controls:"),
             radioButtons(inputId="xAxis", label="X axis", choices=colnames(iris)),
             radioButtons(inputId="yAxis", label="Y axis", choices=colnames(iris),
                          selected="Sepal.Width"),
             radioButtons(inputId="color", label="Color by", choices=colnames(iris),
                          selected="Species")        
    ),
    mainPanel(
            h3("Plot of selected variables:"),
            imageOutput("irisPlot"),
            h4("The predicted species is: "),
            textOutput("prediction"),
            h3("Prediction inputs:"),
            textInput(inputId="sLengthIn", label="Sepal Length"),
            textInput(inputId="sWidthIn", label="Sepal Width"), 
            textInput(inputId="pLengthIn", label="Petal Length"), 
            textInput(inputId="pWidthIn", label="Petal Width"),
            actionButton(inputId="action", label="Predict")
    )
))