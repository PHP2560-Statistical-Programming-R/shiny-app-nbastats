#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.rstudio.com/
#

library(NBAStats)

options(shiny.sanitize.errors = FALSE)
Glossary <- read.csv("glossary.csv")
# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("NBA Stats"),
   
   # develop conditional panels & tabs, keeping track of tab ids 
   sidebarLayout(
      sidebarPanel(
        conditionalPanel(condition="input.tabselected ==0",
                         h3("Instructions"),
                         helpText("Each tab serves to show case different functions from 'NBAstats.' Please feel free to explore the different tabs, some will output data tables, while others visualizes the data via plots."),
                         helpText("Note: The data is pulled in real-time so it might take 20-30 seconds to load. You can switch between different tabs, it will not affect loading time.")),
        conditionalPanel(condition="input.tabselected ==1",
                         h3("Team Schedule"),
                         selectInput("TSteam",
                                     "Choose a team:", 
                                     c("Atlanta Hawks" = "ATL", 
                                       "Boston Celtics" = "BOS",
                                       "Brooklyn Nets" = "BRK",
                                       "New Jersey Nets" = "NJN",
                                       "Charlotte Hornets" = "CHO",
                                       "Charlotte Bobcats" = "CHA",
                                       "Chicago Bulls" = "CHI",
                                       "Cleveland Cavaliers", "CLE",
                                       "Dallas Mavericks" = "DAL",
                                       "Denver Nuggets" = "DEV",
                                       "Detroit Pistons" = "DET",
                                       "Golden State Warriors" = "GSW",
                                       "Houston Rockets" = "HOU",
                                       "Indiana Pacers" = "IND",
                                       "Los Angeles Clippers" = "LAC",
                                       "Los Angeles Lakers" = "LAL",
                                       "Memphis Grizzlies" = "MEM",
                                       "Miami Heat" = "MIA",
                                       "Milwaukee Bucks" = "MIL",
                                       "Minnesota Timberwolves" = "MIN",
                                       "New Orleans Pelicans" = "NOP",
                                       "New Orleans Hornets" = "NOH",
                                       "OKlahoma City Hornets" = "NOK",
                                       "New York Knicks" = "NYK",
                                       "Oklahoma City Thunder" = "OKC",
                                       "Seattle SuperSonics" = "SEA",
                                       "Orlando Magic" = "ORL",
                                       "Philidelphia 76ers" = "PHI",
                                       "Phoenix Suns" = "PHO",
                                       "Portland Trail Blazers" = "POR",
                                       "Sacramento Kings" = "SAC",
                                       "San Antonio Spurs" = "SAS",
                                       "Toronto Raptors" = "TOR",
                                       "Utah Jazz" = "UTA",
                                       "Washington Wizards" = "WAS",
                                       selectize = TRUE)),
                         selectInput("TSyear", "Select a year",
                                     choices = 2008:2018)
        ),
        
        conditionalPanel(condition="input.tabselected ==2",
          h3("Season Plot"),
          selectInput("SPYear", "Choose a Year:",
                      choices = 2008:2018),
          selectInput("SPstat", "Select a statistic",
                      c("Games Played" = "G",
                        "Minutes Played" = "MP",
                        "Field Goals" = "FG",
                        "Field Goals Attempted" = "FGA",
                        "Field Goal Percentage" = "FG%",
                        "3-Point Field Goals" = "3P",
                        "3-Point Field Goal Attempted" = "3PA",
                        "3-Point Field Goal Percentage" = "3P%",
                        "2-Point Field Goals Made" = "2P",
                        "2-Point Field Goal Attemped" = "2PA",
                        "2-Point Field Goal Percentage" = "2P%",
                        "Free Throws Made" = "FT",
                        "Free Throws Attempted" = "FTA",
                        "Free Throw Percentage" = "FT%",
                        "Offensive Rebounds" = "ORB",
                        "Defensive Rebounds" = "DRB",
                        "Total Rebounds" = "TRB",
                        "Assists" = "AST",
                        "Steals" = "STL",
                        "Blocks" = "BLK",
                        "Turnovers" = "TOV",
                        "Personal Fouls" = "PF",
                        "Points" = "PTS"), selectize = TRUE, selected = "AST"),
          h4("________________"),
          dateInput("SPmap","Plot all scheduled games by date",
                    value = "2017-12-18")
          ),
        
        
        conditionalPanel(condition="input.tabselected ==3",
          h3("Standings"),
          selectInput("sYear", "Select a year",
                      choices = 2008:2018),
          uiOutput("standingvar")
          ),
        
        conditionalPanel(condition="input.tabselected ==4",
          h3("Playoffs Stats per Game"),
          selectInput("PPyear", "Select a year",
                      choices = 2008:2018),
          selectInput("PPstat", "Select a statistic",
                      c("Games Played" = "G",
                        "Minutes Played" = "MP",
                        "Field Goals" = "FG",
                        "Field Goals Attempted" = "FGA",
                        "Field Goal Percentage" = "FG%",
                        "3-Point Field Goals" = "3P",
                        "3-Point Field Goal Attempted" = "3PA",
                        "3-Point Field Goal Percentage" = "3P%",
                        "2-Point Field Goals Made" = "2P",
                        "2-Point Field Goal Attemped" = "2PA",
                        "2-Point Field Goal Percentage" = "2P%",
                        "Free Throws Made" = "FT",
                        "Free Throws Attempted" = "FTA",
                        "Free Throw Percentage" = "FT%",
                        "Offensive Rebounds" = "ORB",
                        "Defensive Rebounds" = "DRB",
                        "Total Rebounds" = "TRB",
                        "Assists" = "AST",
                        "Steals" = "STL",
                        "Blocks" = "BLK",
                        "Turnovers" = "TOV",
                        "Personal Fouls" = "PF",
                        "Points" = "PTS")),
          helpText("The red dotted line represents the league average per stat.")
        
         ), 
        
        conditionalPanel(condition="input.tabselected ==5",
          h3("Previous Matchups"),
          selectInput("Mteam1",
                      "First Team", 
                      c("Atlanta Hawks" = "ATL", 
                        "Boston Celtics" = "BOS",
                        "Brooklyn Nets" = "BRK",
                        "New Jersey Nets" = "NJN",
                        "Charlotte Hornets" = "CHO",
                        "Charlotte Bobcats" = "CHA",
                        "Chicago Bulls" = "CHI",
                        "Cleveland Cavaliers", "CLE",
                        "Dallas Mavericks" = "DAL",
                        "Denver Nuggets" = "DEV",
                        "Detroit Pistons" = "DET",
                        "Golden State Warriors" = "GSW",
                        "Houston Rockets" = "HOU",
                        "Indiana Pacers" = "IND",
                        "Los Angeles Clippers" = "LAC",
                        "Los Angeles Lakers" = "LAL",
                        "Memphis Grizzlies" = "MEM",
                        "Miami Heat" = "MIA",
                        "Milwaukee Bucks" = "MIL",
                        "Minnesota Timberwolves" = "MIN",
                        "New Orleans Pelicans" = "NOP",
                        "New Orleans Hornets" = "NOH",
                        "OKlahoma City Hornets" = "NOK",
                        "New York Knicks" = "NYK",
                        "Oklahoma City Thunder" = "OKC",
                        "Seattle SuperSonics" = "SEA",
                        "Orlando Magic" = "ORL",
                        "Philidelphia 76ers" = "PHI",
                        "Phoenix Suns" = "PHO",
                        "Portland Trail Blazers" = "POR",
                        "Sacramento Kings" = "SAC",
                        "San Antonio Spurs" = "SAS",
                        "Toronto Raptors" = "TOR",
                        "Utah Jazz" = "UTA",
                        "Washington Wizards" = "WAS"), selectize = TRUE),
          selectInput("Mteam2",
                      "Second Team", 
                      c("Atlanta Hawks" = "ATL", 
                        "Boston Celtics" = "BOS",
                        "Brooklyn Nets" = "BRK",
                        "New Jersey Nets" = "NJN",
                        "Charlotte Hornets" = "CHO",
                        "Charlotte Bobcats" = "CHA",
                        "Chicago Bulls" = "CHI",
                        "Cleveland Cavaliers", "CLE",
                        "Dallas Mavericks" = "DAL",
                        "Denver Nuggets" = "DEV",
                        "Detroit Pistons" = "DET",
                        "Golden State Warriors" = "GSW",
                        "Houston Rockets" = "HOU",
                        "Indiana Pacers" = "IND",
                        "Los Angeles Clippers" = "LAC",
                        "Los Angeles Lakers" = "LAL",
                        "Memphis Grizzlies" = "MEM",
                        "Miami Heat" = "MIA",
                        "Milwaukee Bucks" = "MIL",
                        "Minnesota Timberwolves" = "MIN",
                        "New Orleans Pelicans" = "NOP",
                        "New Orleans Hornets" = "NOH",
                        "OKlahoma City Hornets" = "NOK",
                        "New York Knicks" = "NYK",
                        "Oklahoma City Thunder" = "OKC",
                        "Seattle SuperSonics" = "SEA",
                        "Orlando Magic" = "ORL",
                        "Philidelphia 76ers" = "PHI",
                        "Phoenix Suns" = "PHO",
                        "Portland Trail Blazers" = "POR",
                        "Sacramento Kings" = "SAC",
                        "San Antonio Spurs" = "SAS",
                        "Toronto Raptors" = "TOR",
                        "Utah Jazz" = "UTA",
                        "Washington Wizards" = "WAS"
                        ), selectize = TRUE, selected = "BOS"),
          numericInput("Mnumber", "Input a Number",
                       value=4)
        ),
        
        conditionalPanel(condition="input.tabselected ==6",
                         h3("Betting"),
                         dateInput("Bdate", "Choose a date",
                                   value="2017-11-02"),
                         uiOutput("oddvar")
        )
        
        ),
      
      # Show a plot of the generated distribution
      mainPanel(
        tabsetPanel(tabPanel("Welcome!",
                             h3("Exploring the R package 'NBAstats'"),
                             h5("Our package serves to retrieve NBA statistics from the Sports Reference website -- live. We hope that this will be a fun tool for NBA fans to explore and learn more about their favorite teams!"),
                             h4("Team Schedule"),
                             h5("Fans can browse their favorite team's game schedule from the last 10 years. Simply select a team and a corresponding year, and data table will be provided for easy browsing."),
                             h4("Season Plot"),
                             h5("By selecting a year and a statistic, you can see how each team did that season compared to each other and the league average. In addition, fans can input a date and see who is playing for that particular day and where."),
                             h4("Standings"),
                             h5("There is a surprisingly large amount of data collected with each season. Fans can use this to look at how each team did each season, by year. To allow the most flexibility, a data table is provided, and you can select which variables to show."),
                             h4("Playoffs Plot"),
                             h5("Similar to the season plot, this outputs a plot that allows fans to compare how each team did during the play offs of a particular year for a given statistic."),
                             h4("Matchups"),
                             h5("Review matchup statistics between any two teams. A data table will be created, and the number of matchups is customizable."),
                             h4("Betting"),
                             h5("Perhaps the most interesting tab, here fans can explore betting statistics for every match of any given date."),
                             value=0),
                    tabPanel("Team Schedule", 
                             value=1,
                             DT::dataTableOutput("tSchedule")),
                    tabPanel("Season Plot",
                             value=2,
                             plotOutput("season"),
                             plotOutput("usMap")),
                    tabPanel("Standings",
                             value=3,
                             DT::dataTableOutput("standings")),
                    tabPanel("Playoff Plot",
                             value=4,
                             plotOutput("plot")),
                    tabPanel("Matchups",
                             value=5,
                             tableOutput("match")),
                    tabPanel("Betting",
                             value=6,
                             DT::dataTableOutput("odds")),
                    id = "tabselected") #to be used with the conditional tabs 
      )
))
      





server <- function(input, output) {

  #Betting Odds 
   output$odds <- DT::renderDataTable({
     odds <- DailyOdds(input$Bdate)
     DT::datatable(odds[, input$vars, drop = FALSE], options = list(scrollX = TRUE))
   })
   
   #dynamic UI to display the check list of variables 
   output$oddvar <- renderUI({
     odds <- DailyOdds(input$Bdate)
     checkboxGroupInput("vars", "Select columns to display", names(odds), selected = names(odds[, 1:8]))
   })
   
   #standings
   output$standings <- DT::renderDataTable({
     standings <- webscrape_standings(input$sYear)
     DT::datatable(standings[, input$standingvar, drop = FALSE], options = list(scrollX = TRUE))
   })
   
   #similar dynamic UI for standings, dynamic so that 
   #if we want to user to be able to call different tables in the future the variables will change accordingly 
   output$standingvar <- renderUI({
     standings <- webscrape_standings(input$sYear)
     checkboxGroupInput("standingvar", "Select columns to display", names(standings), selected = names(standings[, 1:8])) #8 columns was the neatest 
   })
   
   #playoff plot 
   output$plot <- renderPlot({
     stat_plot(input$PPyear, 13, input$PPstat)

   })
   
   #season plot
   output$season <- renderPlot({
     season_plot(input$SPYear, input$SPstat)
   })

   
   #second piece of playoff plot, game location  
   output$usMap <- renderPlot({
     schedule_map(input$SPmap)
   })
   
   #matchups 
   output$match <- renderTable({
     match <- GetLastMatchups.shiny(input$Mteam1, input$Mteam2, input$Mnumber)
     match
   })
   
   #team schedule 
   output$tSchedule <- DT::renderDataTable({
     team <- GetTeamSchedule.shiny(input$TSteam,input$TSyear)
     DT::datatable(team)
   })
}


# Run the application 
shinyApp(ui = ui, server = server)

