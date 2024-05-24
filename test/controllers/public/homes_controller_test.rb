require "test_helper"

class Public::HomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @public_home = public_homes(:one)
  end

  test "should get index" do
    get public_homes_url
    assert_response :success
  end

  test "should get new" do
    get new_public_home_url
    assert_response :success
  end

  test "should create public_home" do
    assert_difference('Public::Home.count') do
      post public_homes_url, params: { public_home: { top: @public_home.top } }
    end

    assert_redirected_to public_home_url(Public::Home.last)
  end

  test "should show public_home" do
    get public_home_url(@public_home)
    assert_response :success
  end

  test "should get edit" do
    get edit_public_home_url(@public_home)
    assert_response :success
  end

  test "should update public_home" do
    patch public_home_url(@public_home), params: { public_home: { top: @public_home.top } }
    assert_redirected_to public_home_url(@public_home)
  end

  test "should destroy public_home" do
    assert_difference('Public::Home.count', -1) do
      delete public_home_url(@public_home)
    end

    assert_redirected_to public_homes_url
  end
end
