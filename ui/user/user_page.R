library(shinydashboard)

source('ui/user/user_header.R')
source('ui/user/user/user_sidebar.R')
source('ui/user/user/user_body.R')


dashboardPage(
  header = header,
  sidebar =  sidebar,
  body = body)