require "application_system_test_case"

class RequestsTest < ApplicationSystemTestCase
  setup do
    @request = requests(:one)
  end

  test "visiting the index" do
    visit requests_url
    assert_selector "h1", text: "Requests"
  end

  test "creating a Request" do
    visit requests_url
    click_on "New Request"

    fill_in "Client", with: @request.client_id
    fill_in "Client name", with: @request.client_name
    fill_in "Dl num", with: @request.dl_num
    fill_in "Dl state", with: @request.dl_state
    fill_in "Dob", with: @request.dob
    fill_in "First name", with: @request.first_name
    fill_in "Last name", with: @request.last_name
    fill_in "Maiden name", with: @request.maiden_name
    fill_in "Middle name", with: @request.middle_name
    fill_in "Notes", with: @request.notes
    fill_in "Ssn", with: @request.ssn
    fill_in "User", with: @request.user_id
    click_on "Create Request"

    assert_text "Request was successfully created"
    click_on "Back"
  end

  test "updating a Request" do
    visit requests_url
    click_on "Edit", match: :first

    fill_in "Client", with: @request.client_id
    fill_in "Client name", with: @request.client_name
    fill_in "Dl num", with: @request.dl_num
    fill_in "Dl state", with: @request.dl_state
    fill_in "Dob", with: @request.dob
    fill_in "First name", with: @request.first_name
    fill_in "Last name", with: @request.last_name
    fill_in "Maiden name", with: @request.maiden_name
    fill_in "Middle name", with: @request.middle_name
    fill_in "Notes", with: @request.notes
    fill_in "Ssn", with: @request.ssn
    fill_in "User", with: @request.user_id
    click_on "Update Request"

    assert_text "Request was successfully updated"
    click_on "Back"
  end

  test "destroying a Request" do
    visit requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Request was successfully destroyed"
  end
end
