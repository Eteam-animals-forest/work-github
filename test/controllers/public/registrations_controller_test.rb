require "test_helper"

class Public::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_registrations_new_url
    assert_response :success
  end

  test "should get create" do
    get public_registrations_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_registrations_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_registrations_update_url
    assert_response :success
  end

  test "should get cancel" do
    get public_registrations_cancel_url
    assert_response :success
  end
end
