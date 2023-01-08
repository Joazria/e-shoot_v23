require "test_helper"

class MoodboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get moodboards_edit_url
    assert_response :success
  end

  test "should get index" do
    get moodboards_index_url
    assert_response :success
  end

  test "should get new" do
    get moodboards_new_url
    assert_response :success
  end
end
