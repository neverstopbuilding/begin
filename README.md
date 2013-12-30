#Begin

> **Given** I want to start writing some code.
>
> **And** I want it to be clean.
>
> **When** I type `begin my-package`.
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

###Options

These options are available:

- `--github_user` - Set this to the user for which you will commit this code, this will turn on the readme widgets (coveralls, travis, code climate). You will still have to enable the repo and set up hooks with these services.
