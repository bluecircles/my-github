#
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(h3("Coursera | Developing Data Products | Course Assignment")),
  tags$br(),
  h4("Instructions"),
  tags$li(h5("This peer assessed assignment has two parts. 
          First, you will create a Shiny application and deploy it on Rstudio's servers. 
          Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch 
          presentation about your application.")),
  tags$br(),
  h4("Summary"),
  tags$li(h5("Prediction of the Height of Cherry Trees in R using Girth and Volume as inputs")),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    sidebarPanel(
        h4("Input 1"),
        sliderInput("Girth", label = "Please enter the Girth of the Tree
                (diameter in inches)", min = 8, max = 21,value = 15, step = 0.1),
        h4("Input 2"),
        sliderInput("Volume", label = "Please enter the Volume of the Tree
                (volume in cubic feet)", min = 10, max = 77,value = 15, step = 0.1),
        submitButton("Submit")
    ),
    # Show a plpt of the generated distribution
    mainPanel(
    tabsetPanel(type= "tabs",
              tabPanel("How to", 
                        tags$li(h5("Move the slider 1 and 2 in order to provide inputs
                                   for the Girth and the Volume of the tree")),
                        tags$li(h5("Press the 'Submit' button to submit your inout")),
                        tags$li(h5("The prediction of the height will be displayed on the 'Results' tab")),
                        tags$li(h5("The prediction will be based on a lineal model that uses only
                                   2 explanatory variables"))
                        ),
              
              tabPanel("Results", 
                       tags$li(h5("Below some explanatory Analysis on the data set")),
                       plotOutput("graph1"),
                       tags$br(),
                       tags$li(h5("Summary Statistics of the data set")),
                       dataTableOutput("table1"),
                       tags$br(),
                       tags$li(h5("Predictions of the Height based on the user input")),
                       h5("Based on the Girth Input of:"), 
                       textOutput("originalG"),
                       h5("and Volume Input of:"),
                       textOutput("originalV"),
                       h5("the predicted tree height is:"),
                       textOutput("pred1")
               ),
                  
              tabPanel("About", 
                        tags$li(h5("For this assigment the Trees dataset was used")), 
                        tags$li(h5("This data set provides measurements of the girth, 
                                   height and volume of timber in 31 felled black cherry trees")),
                        tags$li(h5("The DataFrame contains 31 observations for 3 Variables, 
                                   Height, Volume and Girth")),
                        tags$li(h5("More info:"), tags$a(href = "https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/trees.html", "here"))
                        ),
              tabPanel("Code",
                       h5("Below the R code used for the chart"),
                       h5("")
                        )
               
            )
    )
  )
))
