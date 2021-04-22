require 'test_helper'

class FirmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_user_admin
    @firm = firms(:one)
    @update = {
        first_name: 'Michael',
        last_name: 'Tests',
        dob: '01-01-2000',
        ssn: '111-22-3333',
        dl_state: 'CO'
    }
    #puts(session[:userinfo].present?)
  end

  test "should get index" do
    get firms_url
    assert_response :success
  end

  test "client is redirected if they don't have a client application" do
    sign_in_user2_without_client_application
    get firms_url
    assert_response 302
  end

  test "client should only see their requests on the index page" do
    sign_in_normal_user
    get firms_url
    assert_response :success
  end

  test "should get new" do
    get new_firm_url
    assert_response :success
  end

  test "should create firm" do
    assert_difference('Firm.count') do
      post firms_url, params: { firm: @update }
    end

    assert_redirected_to firm_url(Firm.last)
  end

  test "should stay on same page if create firm is invalid" do
    assert_no_difference('Firm.count') do
      post firms_url, params: {
        firm: {
          invoice_data: 123,
          first_name: "Invalid firm",
          middle_name: 123,
          last_name: 123,
          maiden_name: 123,
          dob: "invalid entry",
          ssn: "invalid entry",
          dl_state: 123,
          dl_number: "invalid entry",
          notes: 123,
          client_request: 123
        }
      }
    end

    assert_response 422
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
    patch firm_url(@firm), params: { firm: @update }
    assert_redirected_to firm_url(@firm)
  end

  test "should stay on same page if update firm is invalid" do
    assert_no_changes(@firm) do
      patch firm_url(@firm), params: {
        firm: {
          invoice_data: 123,
          first_name: "Invalid firm",
          middle_name: 123,
          last_name: 123,
          maiden_name: 123,
          dob: "invalid entry",
          ssn: "invalid entry",
          dl_state: 123,
          dl_number: "invalid entry",
          notes: 123,
          client_request: 123
        }
      }
    end

    assert_response 422
  end

  test "should destroy firm" do
    assert_difference('Firm.count', -1) do
      delete firm_url(@firm)
    end

    assert_redirected_to firms_url
  end
end

