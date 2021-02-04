require 'test_helper'

class FirmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @firm = firms(:one)
  end

  test "should get index" do
    get firms_url
    assert_response :success
  end

  test "should get new" do
    get new_firm_url
    assert_response :success
  end

  test "should create firm" do
    assert_difference('Firm.count') do
      post firms_url, params: { firm: { client_request: @firm.client_request, dl_number: @firm.dl_number, dl_state: @firm.dl_state, dob: @firm.dob, first_name: @firm.first_name, invoice_data: @firm.invoice_data, last_name: @firm.last_name, maiden_name: @firm.maiden_name, middle_name: @firm.middle_name, notes: @firm.notes, ssn: @firm.ssn } }
    end

    assert_redirected_to firm_url(Firm.last)
  end

  test "should show firm" do
    get firm_url(@firm)
    assert_response :success
  end

  test "should get edit" do
    get edit_firm_url(@firm)
    assert_response :success
  end

  test "should update firm" do
    patch firm_url(@firm), params: { firm: { client_request: @firm.client_request, dl_number: @firm.dl_number, dl_state: @firm.dl_state, dob: @firm.dob, first_name: @firm.first_name, invoice_data: @firm.invoice_data, last_name: @firm.last_name, maiden_name: @firm.maiden_name, middle_name: @firm.middle_name, notes: @firm.notes, ssn: @firm.ssn } }
    assert_redirected_to firm_url(@firm)
  end

  test "should destroy firm" do
    assert_difference('Firm.count', -1) do
      delete firm_url(@firm)
    end

    assert_redirected_to firms_url
  end
end
