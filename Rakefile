# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = 'begin'
  gem.homepage = 'http://github.com/neverstopbuilding/begin'
  gem.license = 'MIT'
  gem.summary = 'Quickly create a basic ruby package with clean coding tools.'
  gem.description = 'I don\'t want a single thing preventing me from starting off (even the smallest) library without a good infrastructure to support TDD and clean coding standards. I got tired of reconfiguring the same tools in basically the same way every time. With this one command you can set up a library, fire up Guard, and jump right into the TDD loop: Red, Green, Refactor.'
  gem.email = 'jasonrobertfox@gmail.com'
  gem.authors = ['Jason Fox']
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

desc 'Runs quality checks.'
task quality: [:rubocop]

require 'rubocop/rake_task'
Rubocop::RakeTask.new

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features)

task default: :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "begin #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
