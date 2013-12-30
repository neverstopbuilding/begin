# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'begin/version'

Gem::Specification.new do |spec|
  spec.name          = 'begin'
  spec.version       = Begin::VERSION
  spec.authors       = ['Jason Fox']
  spec.email         = ['jasonrobertfox@gmail.com']
  spec.summary       = 'Quickly create a basic ruby package with clean coding tools.'
  spec.description   = 'I don\'t want a single thing preventing me from starting off (even the smallest) library without a good infrastructure to support TDD and clean coding standards. I got tired of reconfiguring the same tools in basically the same way every time. With this one command you can set up a library, fire up Guard, and jump right into the TDD loop: Red, Green, Refactor.'
  spec.homepage      = 'http://github.com/neverstopbuilding/begin'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency = 'thor'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'rspec', '~> 2.8.0'
  spec.add_development_dependency 'cucumber', '>= 0'
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_development_dependency 'rubocop'
end
