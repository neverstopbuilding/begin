require 'thor'

module Begin
  class Generator < Thor::Group
    include Thor::Actions

    argument :package_name
    class_option :github_user, default: nil

    def self.source_root
      "#{File.dirname(__FILE__)}/../"
    end

    def create_package_directory
      if File.exists?(get_package_name) || File.directory?(get_package_name)
        say  'The directory #{get_package_name} already exists, aborting.', :red
        exit 1
      else
        empty_directory get_package_name
      end
    end

    def create_lib_structure
      empty_directory "#{get_package_name}/lib/#{get_package_name}"
    end

    def create_rspec_structure
      empty_directory "#{get_package_name}/spec/unit/lib/#{get_package_name}"
      empty_directory "#{get_package_name}/spec/integration/lib/#{get_package_name}"
      create_file_from_template 'spec', 'spec_helper.rb'
      create_file_from_template '.rspec'
    end

    def create_rvm_files
      create_file_from_template '.ruby-version'
      create_file_from_template '.ruby-gemset'
    end

    def create_support_files
      @ruby_version = '2.0.0'
      %w(.gitignore .rubocop.yml Gemfile Rakefile README.md .travis.yml Guardfile .blam).each do |file|
        create_file_from_template file
      end
    end

    private

    def create_file_from_template(*args)
      path = args.reduce {|base, arg| File.join(base, arg) }
      tt = File.join('templates', path) + '.tt'
      file = File.join(get_package_name, path)
      template tt, file, get_options
    end

    def get_package_name
      package_name.downcase.gsub(/[-\s]/, '_')
    end


    def get_options

      {ruby_version: '2.0.0', package: get_package_name}
    end

  end
end
