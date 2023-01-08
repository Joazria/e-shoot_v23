require "test_helper"

class AnglesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get angles_show_url
    assert_response :success
  end

  test "should get edit" do
    get angles_edit_url
    assert_response :success
  end

  test "should get index" do
    get angles_index_url
    assert_response :success
  end
end
