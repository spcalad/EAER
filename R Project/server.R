function(input, output) {
  
  output$grafico_principal <- renderPlot({
    
    hist(faithful$eruptions,
         probability = TRUE,
         breaks = as.numeric(input$n_grietas),
         xlab = "Duration (minutes)",
         main = "Geyser eruption duration")
    abline(v = input$constante_vertical, col = "red")
    
    if (input$obs_individuales) {
      rug(faithful$eruptions)
    }
    
    if (input$densidad) {
      dens <- density(faithful$eruptions,
                      adjust = input$bw_adjust)
      lines(dens, col = "blue")
    }
    
  })
}