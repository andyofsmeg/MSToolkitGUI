# MSToolkit Trial Simulator
# See http://mstoolkit.r-forge.r-project.org/ for details of the main package.
# install.packages("MSToolkit", repos="http://R-Forge.R-project.org")

# Define server logic required to draw a histogram
function(input, output) {
  

  
  output$generate <- renderText({
    
    # User inputs
    
    replicateN <- input$replicateN
    subjects <- input$subjects
    
    
    treatDoses <- input$treatDoses
    treatDoses <- paste("c(", treatDoses, ")")
    treatDoses <- eval(parse(text = treatDoses))
    
    conCovNames <- input$conCovNames
    
    conCovMean <- input$conCovMean
    conCovMean <- paste("c(", conCovMean, ")")
    conCovMean <- eval(parse(text = conCovMean))
    
    conCovVCov <- input$conCovVCov
    conCovVCov <- paste("c(", conCovVCov, ")")
    conCovVCov <- eval(parse(text = conCovVCov))
    conCovVCov <- conCovVCov^2
    
    
    conCovCrit <- input$conCovCrit
    
    go <- try(generateData( replicateN = replicateN, 
                            subjects = subjects, 
                            treatDoses = treatDoses, 
                            conCovNames = conCovNames, 
                            conCovMean = conCovMean , 
                            conCovVCov = conCovVCov , 
                            conCovDigits = 1, 
                            conCovCrit = conCovCrit, 
                            genParNames = 'E0,ED50,EMAX', 
                            genParMean = c(2,50,10), 
                            genParVCov = diag( c(.5,30,10) ), 
                            genParBtwNames = 'E0,ED50,EMAX', 
                            genParBtwMean = c(0,0,0), 
                            genParBtwVCov = diag(3), 
                            respEqn = 'E0 + ((DOSE * EMAX)/(DOSE + ED50))',  
                            respVCov = 5, 
                            interimSubj = '.3,.7'))
    
    if(class(go) != "try-error")
      "Done"
    
    else{
      go
    }
    
  })
  
  output$analyze <- renderText({
    
    "Analyze"
    
  })
  
  output$replicate <- renderTable({
    
    x <- try(read.csv("ReplicateData/replicate0001.csv"))
    
    if(class(x) != "try-error")
      x
    
    else{
      airquality
    }
    
  })

  
}
