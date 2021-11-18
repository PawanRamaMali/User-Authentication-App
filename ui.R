# ui = (uiOutput("page"))


fluidPage(title = "Login Page",
          shinyjs::useShinyjs(),
          # fluidRow(
          #   tags$li(class = "dropdown", style = "padding: 8px;",
          #           logoutUI("logout")),
          #   tags$li(class = "dropdown", 
          #           tags$a(icon("help"), 
          #                  href = "https://github.com/",
          #                  title = "GitHub Code"))
          # ),
          
          fluidRow(
            
            # 
            # tags$head(tags$style(".table{margin: 0 auto;}"),
                      
                      includeScript("functions/returnClick.js")
            ),
            loginUI("login"),
            
            uiOutput("home_page")
          # ,
          #   HTML('<div data-iframe-height></div>')
          #   
          #   
          # )
)