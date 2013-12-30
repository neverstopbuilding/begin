Then(/^"(.*?)" should contain the correct files$/) do |package_directory|
  assert_lib_files package_directory
  assert_spec_files package_directory
end

def assert_lib_files(dir)
  check_directory_presence(["#{dir}/lib"], true)
  check_directory_presence(["#{dir}/lib/#{dir}"], true)
end

def assert_spec_files(dir)
  check_directory_presence(["#{dir}/spec/unit/#{dir}"], true)
  check_directory_presence(["#{dir}/spec/integration/#{dir}"], true)
  check_file_presence(["#{dir}/spec/spec_helper.rb"], true)
end
