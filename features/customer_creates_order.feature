@javascript
Feature: Customer creates an order
  Background:
    Given the following products:
     | name  | cost   |
     | Twin  | 325.00 |
     | Queen | 575.00 |
     | King  | 700.00 |
    And I go to the new order page

  Scenario:
    When I choose "Queen $575.00"
    And I click "Add To Cart"
    And I press "Checkout"
    Then I should see "Thank you for completing your purchase."
    And I should see "Queen"
    And I should see "Total: $575.00"
