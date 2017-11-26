#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
data(airquality)
airquality$Ozone[is.na(airquality$Ozone)] = mean(airquality$Ozone, na.rm=TRUE)
airquality$Solar.R[is.na(airquality$Solar.R)] = mean(airquality$Solar.R, na.rm=TRUE)
model<-lm(Ozone~.,airquality)

# Define server logic required to predict using LM and plots.
shinyServer(function(input, output) {
   
  output$airqplot <- renderPlot({
    if(input$radio=="Solar.R"){x<-airquality$Solar.R}
    else if(input$radio=="Day"){x<-airquality$Day}
    else if(input$radio=="Month"){x<-airquality$Month}
    else if(input$radio=="Wind"){x<-airquality$Wind}
    else if(input$radio=="Temperature"){x<-airquality$Temp}
    y<-airquality$Ozone
    xlab<-input$radio
    plot(x,y,xlab=xlab,ylab="Ozone",main=paste(xlab," Versus Ozone"))
    #plot_ly(data=airquality,x=x,y=y)
  })
  
  output$airqtext <- renderText({
    ninput<-data.frame(
      Solar.R=input$solarr,
      Wind=input$wind,
      Temp=input$temp,
      Month=input$month,
      Day=input$day
    )
    val<-round(predict(model,ninput),2)
    paste("With the predictor values provided, the predicted Ozone value is",val,".")
  })
})
