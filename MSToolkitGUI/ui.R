# MSToolkit Trial Simulator
# See http://mstoolkit.r-forge.r-project.org/ for details of the main package.
# install.packages("MSToolkit", repos="http://R-Forge.R-project.org")


# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("MSToolkit Simulation"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    sidebarPanel(
      numericInput("replicateN",
                   "Number of replicates:",
                   10,
                   min = 1),

       numericInput("subjects",
                   "Number of Subjects:",
                   10,
                   min = 1),

      textInput("treatDoses",
                "Dose groups (comma separated):",
                value = "0, 5, 25"),
      
      textInput("conCovNames",
                "Continuous covariate names (comma separated):",
                value = "wt, age"),
      
      textInput("conCovMean",
                "Continuous covariate means (comma separated):",
                value = "83, 55"),
      
      textInput("conCovVCov",
                "Continuous covariate covariance matrix (comma separated):",
                value = "14,10"),
      
      textInput("conCovCrit",
                "Restrictions on continuous covariates (comma separated)",
                value = "18 <= age <= 65"),
      
      submitButton("Go")
      

    ),
    

    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("generateData", textOutput("generate")),
        tabPanel("viewReplicates", tableOutput("replicate")),
        tabPanel("analyzeData", textOutput("analyze"))
      )
    )
  )
)
