library(shiny)
library(ggplot2)
library(dplyr)


server <- function(input, output) {
  
  # Scatter plot
  output$scatter <- renderPlotly({
    title <- paste0("Midwest Dataset Scatterplot")
    p <- ggplot(midwest) +
      geom_point(
        mapping = aes_string(x = input$xaxis, y = input$yaxis),
        size = input$size
      ) +
      labs(title = title)
    p
  })

  # Bar Plot
  output$bar <- renderPlotly({
    # Input from slider about min population total
    population <- input$population
    # Data frame for bar chart
    bar_data <- midwest %>%
      filter(poptotal >= population) %>%
      group_by(state) %>%
      summarise(
        avg_percwhite = mean(percwhite),
        avg_percblack = mean(percblack),
        avg_percamerindan = mean(percamerindan),
        avg_percasian = mean(percasian),
        avg_percother = mean(percother),
        avg_percbelowpoverty = mean(percbelowpoverty),
        avg_percchildbelowpovert = mean(percchildbelowpovert)
      )
    title <- paste("Metro Area Demographics")
    p <- ggplot(bar_data) +
      geom_col(
        mapping = aes(x = state, y = !!as.name(input$yaxis2)),
        fill = input$color
      ) +
      labs(title = title)
    p
  })
}
