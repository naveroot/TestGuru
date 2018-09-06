require 'test_helper'

class BadgesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get badges_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get badges_controller_show_url
    assert_response :success
  end

  test "should get new" do
    get badges_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get badges_controller_create_url
    assert_response :success
  end

  test "should get edit" do
    get badges_controller_edit_url
    assert_response :success
  end

  test "should get update" do
    get badges_controller_update_url
    assert_response :success
  end

  test "should get destroy" do
    get badges_controller_destroy_url
    assert_response :success
  end

end
