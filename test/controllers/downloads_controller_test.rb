require 'test_helper'

class DownloadsControllerTest < ActionDispatch::IntegrationTest

	test 'it should get index' do
		get downloads_url
		assert_response :success
	end

	test "should get new" do
		sign_in_user_admin
	    get new_download_url
	    assert_response :success
	end

	test "should not get new if not admin" do
		sign_in_normal_user
		get new_download_url
	    assert_redirected_to '/'
	end

	test "should create new" do
		sign_in_user_admin
	    post downloads_url, params:{ download:{ title: "Request", file:fixture_file_upload("/sample.pdf")} }
	    assert_redirected_to downloads_url
	end

	test "should not create new if not admin" do
		sign_in_normal_user
	    post downloads_url, params:{ download:{ title: "Request", file:fixture_file_upload("/sample.pdf")} }
	    assert_redirected_to '/'
	end

	test "it should create new even when no file is attached" do
		sign_in_user_admin
	    post downloads_url, params:{ download:{ title: "Hey how are you? Have you completed your task"} }
	    assert_redirected_to downloads_url
	 end

end