require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get "/contact"
    assert_response :success
    assert_select "title", "Contact | Qn Projects"
  end

end
