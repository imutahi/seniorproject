require 'test_helper'

class FirmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    #sign_in_user_firms
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
    sign_in_user_firms
    get firms_url
    assert_response :success
    # puts("in test")
    # sign_in_user
    # get logout_url
    # puts(session[:userinfo])
    # get auth_auth0_callback_url
    # puts(session[:userinfo])
    # puts("end session")
    # get firms_url
    # assert_response :success
    # get logout_url
  end

  test "should get new" do
    sign_in_user_firms
    get new_firm_url
    puts(session[:userinfo])
    puts(session[:userinfo].present?)
    assert_response :success
  end

  test "should create firm" do
    sign_in_user_firms
    assert_difference('Firm.count') do
      post firms_url, params: { firm: @update }
    end

    assert_redirected_to firm_url(Firm.last)
  end

  test "should stay on same page if create firm is invalid" do
    sign_in_user_firms
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
    sign_in_user_firms
    get firm_url(@firm)
    assert_response :success
  end

  test "should get edit" do
    sign_in_user_firms
    get edit_firm_url(@firm)
    assert_response :success
  end

  test "should update firm" do
    sign_in_user_firms
    patch firm_url(@firm), params: { firm: @update }
    assert_redirected_to firm_url(@firm)
  end

  test "should stay on same page if update firm is invalid" do
    sign_in_user_firms
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
    sign_in_user_firms
    assert_difference('Firm.count', -1) do
      delete firm_url(@firm)
    end

    assert_redirected_to firms_url
  end
end

