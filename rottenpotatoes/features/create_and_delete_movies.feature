Feature: create and delete movies
  
  As a user
  So that I can update the list of movies on Rotten Potatoes
  I want to be able to create and delete movies
  

Background: movies in database

    Given the following movies exist:
    | title        | rating | director     | release_date |
    | Star Wars    | PG     | George Lucas |   1977-05-25 |
    | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
    | Alien        | R      |              |   1979-05-25 |
    | THX-1138     | R      | George Lucas |   1971-03-11 |
    
    When I go to the home page

Scenario: create a new movie
    When I follow "Add new movie"
    When I fill in "Title" with "The Force Awakens"
    When I press "Save Changes"
    Then I should see "The Force Awakens"

Scenario: delete an existing movie
    When I follow "More about THX-1138"
    When I press "Delete"
    Then "THX-1138" should be deleted