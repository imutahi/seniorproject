require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clientone = clients(:one)
    @update = clients(:two)
    @updatev2 = {
      client_name: "Willy Wonka",
      status: false,
      total_requests: 1,
      company: "Choco Factory",
      address: "MyString",
      city: "MyString",
      email: "willywonka@test.com",
      state: "CO",
      zip: "11111",
      phone: "504-504-5045",
      fax: "504-504-5045",
      notes: "MyString",
      client_id: 5
    }
  end

  test "should get index for admin user" do
    sign_in_user_admin
    get clients_url
    assert_response :success
  end

  test "should get index normal user" do
    sign_in_normal_user
    get clients_url
    assert_response :success
  end

  test "should get new" do
    sign_in_user_admin
    get new_client_url
    assert_response :success
  end

  # new test for normal users (the set up method logs in as admin)
  test "normal user can create client without status" do
    sign_in_user_without_client_application
    assert_difference('Client.count') do
      post clients_url, params: { client: {
        client_name: "Hugo",
        total_requests: 1,
        company: "Testable Solutions",
        email: "hugo@test.com",
        address: "MyString",
        city: "MyString",
        state: "CO",
        zip: "11111",
        phone: "504-504-5045",
        fax: "504-504-5045",
        notes: "MyString",
        client_id: 4
        }
      }
    end
  end

  test "should create client" do
    sign_in_user_without_client_application_for_update
    assert_difference('Client.count') do
      post clients_url, params: { client: @updatev2}
    end

    assert_redirected_to client_url(Client.last)
  end

  test "should stay on same page if create client is invalid" do
    sign_in_user_admin
    assert_no_difference('Client.count') do
      post clients_url, params: { client: {
        address: 123,
        city: "Nowhere City",
        client_id: 3,
        client_name: "Invalid User",
        company: "ABC Company",
        fax: 123,
        notes: "invalid entry",
        phone: 123,
        state: "CO",
        status: 1,
        total_requests: 2,
        zip: "90210",
        }
      }
    end

    assert_response 422
  end

  test "should show client for admin user" do
    sign_in_user_admin
    get client_url(@clientone)
    assert_response :success
  end

  test "should redirect non-admin users to clients page when trying to show a client" do
    sign_in_normal_user
    get client_url(@clientone)
    assert_response 302
  end

  test "should get edit" do
    sign_in_user_admin
    get edit_client_url(@clientone)
    assert_response :success
  end

  test "should update client" do
    sign_in_user_without_client_application
    patch client_url(@clientone), params: {
      client: {
        client_name: "Hugo Lopez",
        total_requests: 1,
        company: "Testable Solutions",
        email: "hugo@test.com",
        address: "MyString",
        city: "MyString",
        state: "CO",
        zip: "11111",
        phone: "504-504-5045",
        fax: "504-504-5045",
        notes: "MyString",
        client_id: 4
        }
    }
    assert_redirected_to client_url(@clientone) 
  end

  test "should stay on same page if update client is invalid" do
    sign_in_user_admin
    assert_no_changes(@clientone) do
      patch client_url(@clientone), params: {
        client: {
          address: 123,
          city: "Nowhere City",
          client_id: 2,
          client_name: "Invalid User",
          company: "ABC Company",
          fax: 123,
          notes: "invalid entry",
          phone: 123,
          state: "CO",
          status: 1,
          total_requests: 2,
          zip: "90210"
        }
      }
    end

    assert_response 422
  end

  test "should destroy client" do
    sign_in_user_admin
    assert_difference('Client.count', -1) do
      delete client_url(@clientone)
    end

    assert_redirected_to clients_url
  end
end
