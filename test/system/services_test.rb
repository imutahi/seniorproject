require "application_system_test_case"

class ServicesTest < ApplicationSystemTestCase
  setup do
    @service = services(:one)
  end

  test "visiting the index" do
    visit services_url
    assert_selector "h1", text: "Services"
  end

  test "creating a Service" do
    visit services_url
    click_on "New Service"

    fill_in "Description", with: @service.description
    fill_in "Price", with: @service.price
    fill_in "Service type", with: @service.service_type
    click_on "Submit for Approval"

    #assert_text "Service was successfully created"
    assert_no_text "error"
    click_on "Back"
  end

  test "updating a Service" do
    visit services_url
    click_on "Edit", match: :first

    fill_in "Description", with: @service.description
    fill_in "Price", with: @service.price
    fill_in "Service type", with: @service.service_type
    click_on "Submit for Approval"

    #assert_text "Service was successfully updated"
    assert_no_text "error"
    click_on "Back"
  end

  test "destroying a Service" do
    visit services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    #assert_text "Service was successfully destroyed"
    assert_no_text "error"
  end

  test "make sure error messages appear if invalid services is created" do
    visit new_service_url
    click_on "Submit for Approval"
    assert_selector "h2", text: /\A*errors*/
  end

  test "make sure error messages appear if updated service is invalid" do
    visit services_url
    click_on "Edit", match: :first
    fill_in "Service type", with: ""
    fill_in "Price", with: ""
    click_on "Submit for Approval"
    assert_selector "h2", text: /\A*errors*/
  end

end
