require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get services_url
    assert_response :success
  end

  test "should get new" do
    get new_service_url
    assert_response :success
  end

  test "should create service" do
    assert_difference('Service.count') do
      post services_url, params: { service: { description: @service.description, price: @service.price, service_type: @service.service_type } }
    end

    assert_redirected_to service_url(Service.last)
  end

  test "should stay on same page if create service is invalid" do
    assert_no_difference('Service.count') do
      post services_url, params: {
        service: {
          service_type: nil,
          description: nil,
          price: nil,
        }
      }
    end

    assert_response 422
  end

  test "should show service" do
    get service_url(@service)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_url(@service)
    assert_response :success
  end

  test "should update service" do
    patch service_url(@service), params: { service: { description: @service.description, price: @service.price, service_type: @service.service_type } }
    assert_redirected_to service_url(@service)
  end

  test "should stay on same page if update service is invalid" do
    assert_no_changes(@service) do
      patch service_url(@service), params: {
        service: {
          service_type: nil,
          description: nil,
          price: nil,
        }
      }
    end

    assert_response 422
  end

  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete service_url(@service)
    end

    assert_redirected_to services_url
  end
end
