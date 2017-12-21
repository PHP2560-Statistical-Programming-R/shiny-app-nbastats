
#NBA Stats Description

NBA stats is an app that pulls live NBA statistics from the website https://www.basketball-reference.com/ , and helps to analyze and visualize statistics from 2008 through 2018. The betting odds are pulled from the website http://www.donbest.com/nba/odds/money-lines/.

####Author: David, Derrick, Michael, Teresa, Lisha


####Target Audience: Basketball fans, and journalists  


####Introduction and Usage:
####First tab:
The schedule for a team of selected season. Please select a team and a year.

####Second tab:
The second tab consist of two parts. 
The first part includes the plots of important stats for all teams and league during the selected regular season. Please select a year and the stats you wanna see.
The second part is a map which shows the cities that have games on selected date. Please select a date.

####Third tab: 
The standings for selected season. Please choose a year.

####Fourth tab:
The plots of important stats for all teams and league during the selected playoffs. Please select a year and the stats you wanna see.

####Fifth tab: 
Show the game history of two teams in the past 3 years. Please select two teams and the number of past games.

####Sixth tab: 
The betting odds on selected date. Please select a date.

In addition to pulling team statistics directly off of the web, a number of fucntions have been added to pull from the live NBA statistics. 

The package:

1.First, scrapes from the webpages for different statistics

2.Second, combines all the scaped tables into a tibble

3.Third, cleans all the data

4.Fourth, loads the functions

A list of our functions include:

1. A function that sets abbreviations to team names
2. A function that calculates win probability
3. A betting function that allows the user to specify two teams and get the daily odds of winning
4. A function to that provides the last match up dates between teams
5. A function that provides a team's season stats during regular season
6. A function that provides the specified team's schedule
7. A function that sets team's names to abbreviations
8. A function that provides play-off statistics
9. A function that gets the schedule for all teams in the league during regular season and playoffs
10. A function that populates a U.S. map of the games played on a specified date, visualized by home team name and arena
11. A function that provides team standings in the league
12. A function that provides team statistics during the playoffs
13. A function that plots playoffs statistics
14. A function that plots season statistics
