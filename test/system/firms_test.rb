require "application_system_test_case"

class FirmsTest < ApplicationSystemTestCase
  setup do
    @firm = firms(:one)
  end

  test "visiting the index" do
    visit firms_url
    assert_selector "h1", text: "Requests"
  end

  test "creating a Firm" do
    visit firms_url
    click_on "New Request"

    #fill_in "Client request", with: @firm.client_request
    fill_in "Dl number", with: @firm.dl_number
    fill_in "Dl state", with: @firm.dl_state
    fill_in "Dob", with: @firm.dob
    fill_in "First name", with: @firm.first_name
    #fill_in "Invoice data", with: @firm.invoice_data
    fill_in "Last name", with: @firm.last_name
    fill_in "Maiden name", with: @firm.maiden_name
    fill_in "Middle name", with: @firm.middle_name
    fill_in "Notes", with: @firm.notes
    fill_in "Ssn", with: @firm.ssn
    click_on "Create Request"

    #assert_text "Firm was successfully created"
    assert_no_text "error"
    click_on "Back"
  end

  test "updating a Firm" do
    visit firms_url
    click_on "Edit", match: :first

    #fill_in "Client request", with: @firm.client_request
    fill_in "Dl number", with: @firm.dl_number
    fill_in "Dl state", with: @firm.dl_state
    fill_in "Dob", with: @firm.dob
    fill_in "First name", with: @firm.first_name
    #fill_in "Invoice data", with: @firm.invoice_data
    fill_in "Last name", with: @firm.last_name
    fill_in "Maiden name", with: @firm.maiden_name
    fill_in "Middle name", with: @firm.middle_name
    fill_in "Notes", with: @firm.notes
    fill_in "Ssn", with: @firm.ssn
    click_on "Create Request"

    #assert_text "Firm was successfully updated"
    assert_no_text "error"
    click_on "Back"
  end

  test "destroying a Firm" do
    visit firms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    #assert_text "Firm was successfully destroyed"
    assert_no_text "error"
  end

  test "make sure error messages appear if invalid firm is created" do
    visit new_firm_url
    click_on "Create Request"
    assert_selector "h2", text: /\A*errors*/
  end

  test "make sure error messages appear if updated firm is invalid" do
    visit firms_url
    click_on "Edit", match: :first
    fill_in "Ssn", with: ""
    fill_in "First name", with: ""
    fill_in "Dob", with: ""
    click_on "Create Request"
    assert_selector "h2", text: /\A*errors*/
  end

end
