Feature: User sign up and registration
  As a user
  I want to sign up to (SPACE)CAR Next Door to keep track of cars on the moon

  Scenario: A user signs up with valid information
    Given I am on the sign up page
    When I sign up as a user with email 'test@example.com'
    Then I should have an account

  Scenario: A user signs in with valid information
    Given I am on the login page
    And I have already registered as 'test@example.com'
    When I login with 'test@example.com'
    Then I should see '(Space)Car Next Door'