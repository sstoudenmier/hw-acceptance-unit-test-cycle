Feature: sort movies by header
  
  As a user
  So that I can alter how I view the movies on the home page
  I want to be able to sort the movies by their header

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
  
  When I go to the home page

Scenario: sort the movies by title
  When I follow "Movie Title"
  Then I should see "Alien" before "Blade Runner"
  Then I should see "Star Wars" before "THX-1138"
  Then I should see "Alien" before "Star Wars"

Scenario: sort the movies by release date
  When I follow "Release Date"
  Then I should see "THX-1138" before "Star Wars"
  Then I should see "Alien" before "Blade Runner"
  Then I should see "THX-1138" before "Alien"
