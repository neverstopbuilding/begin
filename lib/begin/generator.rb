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
      if File.exists?(clean_package_name) || File.directory?(clean_package_name)
        say  'The directory #{clean_package_name} already exists, aborting.', :red
        exit 1
      else
        empty_directory clean_package_name
      end
    end

    def create_lib_structure
      empty_directory "#{clean_package_name}/lib/#{clean_package_name}"
    end

    def create_rspec_structure
      empty_directory "#{clean_package_name}/spec/unit/lib/#{clean_package_name}"
      empty_directory "#{clean_package_name}/spec/integration/lib/#{clean_package_name}"
      create_file_from_template 'spec', 'spec_helper.rb'
      create_file_from_template '.rspec'
    end

    def create_rvm_files
      create_file_from_template '.ruby-version'
      create_file_from_template '.ruby-gemset'
    end

    def create_support_files
      %w(.gitignore .rubocop.yml Gemfile Rakefile README.md .travis.yml Guardfile .blam).each do |file|
        create_file_from_template file
      end
    end

    private

    def create_file_from_template(*args)
      path = args.reduce { |a, e| File.join(a, e) }
      tt = File.join('templates', path) + '.tt'
      file = File.join(clean_package_name, path)
      template tt, file, template_options
    end

    def clean_package_name
      package_name.downcase.gsub(/[-\s]/, '_')
    end

    def template_options
      { ruby_version: '2.0.0', package: clean_package_name }
    end
  end
end
