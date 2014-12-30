Feature: Shopping List
  As a user of shopping list
  I want to be able to use the shopping list
  So that I can remember what to buy at the store

  Scenario: Add items to the list
    Given I open the shopping list
    When I type in "add pizza"
    And I type in "add peanut butter"
    And I type in "list"
    Then I should see "2" items on the list

  Scenario: Validate multi word items are in the output
    Given I open the shopping list
    When I type in "add pizza"
    And I type in "add peanut butter"
    And I type in "list"
    Then I should see "peanut butter" in the output

  Scenario: Validate removing items removes them from the list
    Given I open the shopping list
    When I type in "add pizza"
    And I type in "add peanut butter"
    And I type in "add crackers"
    And I type in "remove pizza"
    And I type in "list"
    Then I should not see "pizza" in the output
    And I should see "crackers" in the output
