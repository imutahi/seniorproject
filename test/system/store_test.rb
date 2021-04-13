require "application_system_test_case"

class StoreTest < ApplicationSystemTestCase

  test "foo" do
    visit store_index_url
    assert_text "Talon Agency Checkout"
  end

end