@announce
Feature: Create default package
  In order start the TDD cycle immediately
  As a clean coder
  I want to quickly create a package to support good development practices

  Scenario: Create package
    Given I run `bundle exec begin mypackage`
    Then a directory named "mypackage" should exist
    And "mypackage" should contain the correct files
