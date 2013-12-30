require 'thor'

module Begin
  class Generator < Thor::Group
    include Thor::Actions

    argument :package_name

    def self.source_root
      "#{File.dirname(__FILE__)}/../"
    end

    def create_package_directory
      if File.exists?(package_name) || File.directory?(package_name)
        say  'The directory #{package_name} already exists, aborting.', :red
        exit 1
      else
        empty_directory package_name
      end
    end

    def create_lib_structure
      empty_directory "#{package_name}/lib/#{package_name}"
    end

    def create_rspec_structure
      empty_directory "#{package_name}/spec/unit/#{package_name}"
      empty_directory "#{package_name}/spec/integration/#{package_name}"
      template 'templates/spec/spec_helper.tt', "#{package_name}/spec/spec_helper.rb"
    end
  end
end
