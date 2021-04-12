require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
    test 'user is admin' do
        sign_in_user_admin
        assert_equal @controller.curr_user_is_admin?, true
    end
    test 'user is not admin' do
        sign_in_normal_user
        assert_equal @controller.curr_user_is_admin?, false
    end
end