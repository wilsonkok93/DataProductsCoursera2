#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Air quality data set analysis"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Predictor Variables"),
      sliderInput("month",label="Months",
                  min=5, max=9, value=5),
      sliderInput("day", label="Day of Month",
                  min=1, max=31, value=1),
    sliderInput("solarr", label="Solar.R",
                min=7, max=334, value=7),
    sliderInput("temp", label="Temperature",
                min=56, max=97, value=56),
    sliderInput("wind", label="Wind",
                min=1.7, max=20.7, value=1.7),
    radioButtons("radio", "Plot variable", choices = c("Month","Day","Solar.R","Wind","Temperature"), selected = "Wind")
  ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h3("Plot"),
       plotOutput("airqplot"),
       h3("Prediction Result"),
       textOutput("airqtext"),
       h3("Documentation"),
       h4("Use the predictor variable range inputs to manipulate the prediction results, and use the plot variables to determine which plot to be shown in the interface.")
    ),
    "left",fluid=TRUE
  )
))