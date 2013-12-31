#Begin
[![Build Status](https://travis-ci.org/neverstopbuilding/begin.png)](https://travis-ci.org/neverstopbuilding/begin) [![Code Climate](https://codeclimate.com/github/neverstopbuilding/begin.png)](https://codeclimate.com/github/neverstopbuilding/begin) [![Gem Version](https://badge.fury.io/rb/begin.png)](http://badge.fury.io/rb/begin)

> **Given** I want to start writing some code.
>
> **And** I want it to be clean.
>
> **When** I type `begin my_package`.
>
> **And** install the dependencies.
>
> **Then** I can immediately start writing tests.

###Why?
I don't want a single thing preventing me from starting off (even the smallest) library without a good infrastructure to support TDD and clean coding standards. I got tired of reconfiguring the same tools in basically the same way every time. With this one command you can set up a library, fire up Guard, and jump right into the TDD loop: Red, Green, Refactor.

That's all there is too it, right now these are included and configured:

- RSpec (unit and integration tests)
- Blam (file generation)
- Travis
- Coveralls
- Code Climate
- Rake
- gitignore
- README
- Gemfile
- Rubocop
- Reek
- Flay
- Guard
- RVM

###Setup and Configuration

These options are available:

- `--github_user` - Set this to the user for which you will commit this code, this will turn on the readme widgets (coveralls, travis, code climate). You will still have to enable the repo and set up hooks with these services.


To set everything up fastest do this:

1. Begin your project: `begin myproject --github_user=myuser`
2. Create a new repository for the code on github
3. Initialize a git repository locally and commit everything, push master
4. Import your project to Code Climate
5. Import your project to Coveralls
6. Turn on your project in TravisCI

The next time you push your code, it will kick off a Travis build and update coveralls as a result.
