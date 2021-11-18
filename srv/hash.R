
user_base <- data_frame(
  user = c("user1", "user2"),
  password = c("pass1", "pass2"), 
  password_hash = sapply(c("pass1", "pass2"), sodium::password_store), 
  permissions = c("admin", "standard"),
  name = c("User One", "User Two")
)


credentials <- callModule(
  login,
  "login",
  data = user_base,
  user_col = user,
  pwd_col = password_hash,
  sodium_hashed = TRUE,
  log_out = reactive(logout_init())
)

logout_init <-
  callModule(logout, "logout", reactive(credentials()$user_auth))

observe({
  if (credentials()$user_auth) {
    shinyjs::removeClass(selector = "body", class = "sidebar-collapse")
  } else {
    shinyjs::addClass(selector = "body", class = "sidebar-collapse")
  }
})

# output$user_table <- renderUI({
#   # only show pre-login
#   if(credentials()$user_auth) return(NULL)
#
#   tagList(
#     tags$p("test the different outputs from the sample logins below
#            as well as an invalid login attempt.", class = "text-center"),
#
#     renderTable({user_base[, -3]})
#   )
# })

user_info <- reactive({
  credentials()$info
})

# user_data <- reactive({
#   req(credentials()$user_auth)
#   
#   if (user_info()$permissions == "admin") {
#     dplyr::starwars[, 1:10]
#   } else if (user_info()$permissions == "standard") {
#     dplyr::storms[, 1:11]
#   }
#   
# })

# output$welcome <- renderText({
#   req(credentials()$user_auth)
#   
#   glue("Welcome {user_info()$name}")
# })

output$home_page <- renderUI({
  req(credentials()$user_auth)
  
  if (user_info()$permissions == 'admin'){
    # Admin Page ----
    source('ui/admin/admin_page.R', local = TRUE)$value
    
  }
  
  else
    
  {
    # Admin Page ----
    source('ui/user/user_page.R', local = TRUE)$value
    
  }
    

  # fluidRow(column(
  #   width = 12,
  #   tags$h2(
  #     glue(
  #       "Your permission level is: {user_info()$permissions}.
  #                    Your data is: {ifelse(user_info()$permissions == 'admin', 'Starwars', 'Storms')}."
  #     )
  #   ),
  #   box(
  #     width = NULL,
  #     status = "primary",
  #     title = ifelse(
  #       user_info()$permissions == 'admin',
  #       "Starwars Data",
  #       "Storms Data"
  #     ),
  #     DT::renderDT(user_data(), options = list(scrollX = TRUE))
  #   )
  # ))
})
