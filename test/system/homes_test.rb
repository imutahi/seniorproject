require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit home_index_url
    assert_selector "h1", text: "The most comprehensive background checks in the US"
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
