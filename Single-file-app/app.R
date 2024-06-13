# load packages ----
library(shiny)

# user interface ----
ui <- fluidPage(
  
  # app title ----
  tags$h1("My App Title"), # alternatively, you can use the `h1()` wrapper function
  
  # app subtitle ----
  h4(strong("Exploring Antarctic Penguin Data")), # alternatively, `tags$h4(tags$strong("text"))`
  
  
  # body mass slider ----
  sliderInput(inputId = "body_mass_input", label = "Select a range of body masses (g):",
              min = 2700, max = 6300, value = c(3000, 4000)),
  
  # body mass plot output ----
  plotOutput(outputId = "bodyMass_scatterplot_output") 
  
)

# server instructions ----
server <- function(input, output) {
  
  # render penguin scatter plot ----
  output$bodyMass_scatterplot_output <- # code to generate plot here

# server instructions ----
server <- function(input, output) {
  
  # render penguin scatter plot ----
  output$bodyMass_scatterplot_output <- renderPlot({
    
    # code to generate plot here
    
  }) 
  

}}

# combine UI & server into an app ----
shinyApp(ui = ui, server = server)






