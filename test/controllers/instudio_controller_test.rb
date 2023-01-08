require "test_helper"

class InstudioControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get instudio_edit_url
    assert_response :success
  end

  test "should get index" do
    get instudio_index_url
    assert_response :success
  end

  test "should get new" do
    get instudio_new_url
    assert_response :success
  end

  test "should get show" do
    get instudio_show_url
    assert_response :success
  end
end
