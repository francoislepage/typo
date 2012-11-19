Feature: Merge Articles
  As a blog administrator
  In order to group similar articles from multiple bloggers
  I want to be able to merge articles together

  Background:
    Given the blog is set up
    And the following users exists:
    | email             | name   | login  | password   | state   | 
    | user1@example.com | User 1 | user1  | aaaaaaaa   | active  | 
    | user2@example.com | User 2 | user2  | aaaaaaaa   | active  | 
    And the following articles exists:
    | user_id    | title              | body            |
    | 2          | About Mercedes     | Mercedes suck   |
    | 3          | About Cars         | BMW are ok      |
    | 2          | My Ferrari         | Ferrari rock    |
    
  Scenario: An admin can merge articles
    Given I am logged into the admin panel as "admin" identified by "aaaaaaaa"
    And I am on the edit article page for "About Mercedes"
    When I fill in "merge_with" with "the article id of My Ferrari" 
    And I press "Merge"
    Then I should not see "About Mercedes"
    And I should see "My Ferrari"
    And I should see "The article was merged successfully"

    Scenario: A non-admin cannot merge articles
    When I am on the edit article page
    Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am on the new article page

    Given I am on the edit article page for "About Mercedes"
    When I fill in "Article ID" with "100"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"

  Scenario: When articles are merged, the merged article should have one author (either one of the authors of the two original articles)
    Given PENDING: to be implemented

  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article
    Given PENDING: to be implemented

  Scenario: The title of the new article should be the title from either one of the merged articles 
    Given PENDING: to be implemented

  Scenario: The form field containing the ID of the article to merge with must have the HTML attribute name set to merge_with. This requirement is present for the sole purpose of allowing the autograder to identify the merge functionality in your deployed application and is not something you would normally do in Rails. There should be exactly one input element with the name merge_with on the edit article page
    Given PENDING: to be implemented
