require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit home_index_url
    assert_selector "h1", text: "Welcome to Talon Agency | 800-501-3256"
  end

  test "visting the show page" do
    visit home_show_url
    assert_selector "h1", text: "User Profile"
  end

  test "visiting the about page" do
    visit home_about_url
    assert_selector "h1", text: "About"
  end
end
