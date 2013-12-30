Then(/^"(.*?)" should contain the correct files$/) do |package_directory|
  assert_contains_lib_files package_directory
end

def assert_contains_lib_files(dir)
  check_directory_presence(["#{dir}/lib"], true)
  check_directory_presence(["#{dir}/lib/#{dir}"], true)
end
