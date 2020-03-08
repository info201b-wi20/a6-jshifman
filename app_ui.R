library(shiny)
library(ggplot2)
library(plotly)

selected_values1 <- colnames(midwest)
# Column names for bar chart data
selected_values2 <- c(
  "avg_percwhite",
  "avg_percblack",
  "avg_percamerindan",
  "avg_percasian",
  "avg_percother",
  "avg_percbelowpoverty",
  "avg_percchildbelowpovert"
)

x_input <- selectInput(
  "xaxis",
  label = "X-Axis Value",
  choices = selected_values1,
  selected = "poptotal"
)

y_input <- selectInput(
  "yaxis",
  label = "Y-Axis Value",
  choices = selected_values1,
  selected = "percwhite"
)

# Bar chart y-axis value
y_input2 <- selectInput(
  "yaxis2",
  label = "Y-Axis Value",
  choices = selected_values2,
  selected = "avg_percbelowpoverty"
)

size_input <- sliderInput(
  "size",
  label = "Size of point", min = 1, max = 10, value = 5
)

color_input <- selectInput(
  "color",
  label = "Color",
  choices = list("Red" = "red", "Blue" = "blue", "Green" = "green")
)

population_input <- sliderInput(
  "population",
  label = "Minimum Population",
  min = 1700,
  max = 5000000,
  value = 200000,
  step = 100000,
)

# Scatter plot tab
tab1 <- tabPanel(
  "Scatter plot",
  h1("A6 Homework"),
  sidebarLayout(
    sidebarPanel(
      x_input,
      y_input,
      size_input
    ),
    mainPanel(
      plotlyOutput("scatter")
    )
  )
)

# Bar plot tab
tab2 <- tabPanel(
  "Bar Graph",
  h1("A6 Homework"),
  sidebarLayout(
    sidebarPanel(
      y_input2,
      population_input,
      color_input,
    ),
    mainPanel(
      plotlyOutput("bar")
    )
  )
)

ui <- navbarPage(
  "Graphs",
  tab1,
  tab2
)
