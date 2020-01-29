require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get home page" do
    get hashtags_url
    assert_response :success, 'home response failed'
  end

  test "h1 should be Tweet Hunter" do
    get "/"
    assert_select "h1", "Tweet Hunter"
  end
end
