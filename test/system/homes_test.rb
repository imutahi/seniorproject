require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit home_index_url
    assert_selector "h1", text: "Welcome to Talon Agency | 800-501-3256"
  end
end
