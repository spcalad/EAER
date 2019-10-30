bootstrapPage(
  
  selectInput(inputId = "n_grietas",
              label = "Number of bins in histograma (approximate):",
              choices = c(10, 20, 35, 50),
              selected = 20),
  
  checkboxInput(inputId = "obs_individuales",
                label = strong("Show individual observations"),
                value = FALSE),
  
  checkboxInput(inputId = "densidad",
                label = strong("Show density estimate"),
                value = FALSE),
  
  sliderInput(inputId = "constante_vertical",
              label = "Vertical constant",
              min = min(faithful$eruptions), max = max(faithful$eruptions),value = mean(faithful$eruptions), step = 0.5),
  
  plotOutput(outputId = "grafico_principal", height = "300px"),
  
  # Display this only if the density is shown
  conditionalPanel(condition = "input.densidad == true",
                   sliderInput(inputId = "bw_adjust",
                               label = "Bandwidth adjustment:",
                               min = 0.2, max = 2, value = 1, step = 0.2)
  )
  
)