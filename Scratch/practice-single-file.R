# load packages ----
library(shiny)
library(palmerpenguins)
library(tidyverse)

# user interface ----
ui <- fluidPage(
  
  # ~ previous code omitted for brevity ~
  
  # body mass slider ----
  sliderInput(inputId = "body_mass_input", label = "Select a range of body masses (g):",
              min = 2700, max = 6300, value = c(3000, 4000)),
  
  # body mass plot output ----
  plotOutput(outputId = "bodyMass_scatterplot_output")
  
)

# server instructions ----
server <- function(input, output) {
  
  # render penguin scatter plot ----
  output$bodyMass_scatterplot_output <- renderPlot({ 
    ggplot(na.omit(penguins),
           aes(x = flipper_length_mm, y = bill_length_mm,
               color = species, shape = species)) + 
      geom_point() + 
      scale_color_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)", y = "Bill length (mm)", 
           color = "Penguin species", shape = "Penguin species") + 
      theme_minimal() + 
      theme(legend.position = c(0.85, 0.2), 
            legend.background = element_rect(color = "white")) 
  })
}