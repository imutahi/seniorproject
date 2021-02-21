require 'test_helper'

class LogoutHelperTest < ActionView::TestCase

  test "should return a url that contains /v2/logout" do
    assert_match /v2\/logout/, logout_url.to_s
  end

  test "should return a hash for to_query" do
    hash = { returnTo: "root", clientId: "33" }
    assert_not_nil to_query(hash)
  end

end