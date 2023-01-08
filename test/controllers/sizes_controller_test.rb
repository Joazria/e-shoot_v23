require "test_helper"

class SizesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get sizes_show_url
    assert_response :success
  end

  test "should get edit" do
    get sizes_edit_url
    assert_response :success
  end

  test "should get index" do
    get sizes_index_url
    assert_response :success
  end
end
