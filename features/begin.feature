@announce
Feature: Create default package
  In order start the TDD cycle immediately
  As a clean coder
  I want to quickly create a package to support good development practices

  Scenario: Create package
    Given I run `bundle exec begin mypackage`
    Then a directory named "mypackage" should exist
    And "mypackage" should contain the correct files
    And the file "mypackage/.ruby-gemset" should contain "mypackage"
    And the file "mypackage/.ruby-version" should contain "2.0.0"
    And the file "mypackage/.travis.yml" should contain "2.0.0"
    And the file "mypackage/Gemfile" should contain "2.0.0"
    And the file "mypackage/README.md" should contain "Mypackage Documentation"
    And the file "mypackage/README.md" should not contain "Build Status"

Scenario: Create package with readme icons
    Given I run `bundle exec begin mypackage --github_user=myuser`
    And the file "mypackage/README.md" should contain "Build Status"
