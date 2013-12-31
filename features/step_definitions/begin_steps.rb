Then(/^"(.*?)" should contain the correct files$/) do |package_directory|
  assert_lib_files package_directory
  assert_spec_files package_directory
  assert_rvm_files package_directory
  assert_support_files package_directory
end

def assert_lib_files(dir)
  check_directory_presence(["#{dir}/lib"], true)
  check_directory_presence(["#{dir}/lib/#{dir}"], true)
end

def assert_spec_files(dir)
  check_directory_presence(["#{dir}/spec/unit/lib/#{dir}"], true)
  check_directory_presence(["#{dir}/spec/integration/lib/#{dir}"], true)
  file_exists? dir, 'spec', 'spec_helper.rb'
  file_exists? dir, '.rspec'
end

def assert_rvm_files(dir)
  %w(.ruby-gemset .ruby-version).each do |file|
    file_exists? dir, file
  end
end

def assert_support_files(dir)
  %w(.gitignore .rubocop.yml Gemfile Rakefile README.md .travis.yml Guardfile .blam).each do |file|
    file_exists? dir, file
  end
end

def file_exists?(*args)
  check_file_presence([args.reduce { |a, e| File.join(a, e) }], true)
end
