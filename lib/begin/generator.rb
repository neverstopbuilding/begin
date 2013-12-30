require 'thor'

module Begin
  class Generator < Thor::Group
    include Thor::Actions

    argument :package_name

    def self.source_root
      puts "got here"
      File.dirname(__FILE__)
    end

    def create_package_directory
      if File.exists?(package_name) || File.directory?(package_name)
        say  'The directory #{package_name} already exists, aborting.', :red
        exit 1
      else
        empty_directory package_name
      end
    end
  end
end
