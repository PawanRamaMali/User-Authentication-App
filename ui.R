fluidPage(
  title = "Login Page",
  shinyjs::useShinyjs(),
  includeScript("functions/returnClick.js"),
  loginUI("login"),
  uiOutput("home_page")
)