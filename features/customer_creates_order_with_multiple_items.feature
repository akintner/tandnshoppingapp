@javascript
Feature: Customer creates an order with multiple products
  Background:
    Given the following products:
     | name  | cost   |
     | Twin  | 325.00 |
     | Queen | 575.00 |
     | King  | 700.00 |
    And I go to the order page

  Scenario:
    When I choose "Queen $575.00"
    And I click "Add To Cart"
    And I choose "Twin $325.00"
    And I click "Add To Cart"
    And I press "Checkout"
    Then I should see "Thank you for completing your purchase."
    And I should see "Queen"
    And I should see "$575.00"
    And I should see "Twin"
    And I should see "$325.00"
    And I should see "Total: $900.00"
