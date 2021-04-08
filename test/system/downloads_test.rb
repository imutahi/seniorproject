require "application_system_test_case"

class DownloadsTest < ApplicationSystemTestCase
    setup do
        sign_in_system_admin
        @download = downloads(:one)
    end
    test "should get index" do
        visit downloads_url
        assert_selector "h1", text: "Download Request"
    end

    test "should get new" do
	    visit new_download_url
        assert_selector "h1", text: "New Request"
	end

    test "should create new" do
	    #post downloads_url, params:{ download:{ title: "Request", file:fixture_file_upload("/sample.pdf")} }
	    visit new_download_url
        fill_in "Title", with: "Test"
        page.attach_file('File', Rails.root + 'test/fixtures/sample.pdf', make_visible: true)
        click_on "Create Request"
        assert_text "Download Request"
        #assert_redirected_to downloads_url
	end

    test "it should create new even when no file is attached" do
        visit new_download_url
        fill_in "Title", with: "Hey how are you? Have you completed your task"
        click_on "Create Request"
        assert_text "Download Request"
	 end

    test "destroying a Request" do
        visit downloads_url
        page.accept_confirm do
          click_on "Destroy", match: :first
        end

        #assert_text "Client was successfully destroyed"
        assert_no_text "error"
    end
end