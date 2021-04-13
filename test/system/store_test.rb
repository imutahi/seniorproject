require "application_system_test_case"

class StoreTest < ApplicationSystemTestCase

  test "visiting the checkout page" do
    visit store_index_url
    assert_text "Talon Agency Checkout"
  end

end