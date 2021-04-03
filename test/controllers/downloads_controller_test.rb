require 'test_helper'

class DownloadsControllerTest < ActionDispatch::IntegrationTest

	test 'it should get index' do
		get downloads_url
		assert_response :success
	end

	test "should get new" do
	    get new_download_url
	    assert_response :success
	end

	test "should create new" do
	    post downloads_url, params:{ download:{ title: "Request", file:fixture_file_upload("/sample.pdf")} }
	    assert_redirected_to downloads_url
	end
	test "it should create new even when no file is attached" do
	    post downloads_url, params:{ download:{ title: "Hey how are you? Have you completed your task"} }
	    assert_redirected_to downloads_url
	 end

end