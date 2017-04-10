require 'test_helper'

class RecoveryPasswordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recovery_password = recovery_passwords(:one)
  end

  test "should get index" do
    get recovery_passwords_url
    assert_response :success
  end

  test "should get new" do
    get new_recovery_password_url
    assert_response :success
  end

  test "should create recovery_password" do
    assert_difference('RecoveryPassword.count') do
      post recovery_passwords_url, params: { recovery_password: { created_at: @recovery_password.created_at, delete_at: @recovery_password.delete_at, progress: @recovery_password.progress, recovery_password_id: @recovery_password.recovery_password_id, state: @recovery_password.state, token: @recovery_password.token, update_at: @recovery_password.update_at, user_id: @recovery_password.user_id } }
    end

    assert_redirected_to recovery_password_url(RecoveryPassword.last)
  end

  test "should show recovery_password" do
    get recovery_password_url(@recovery_password)
    assert_response :success
  end

  test "should get edit" do
    get edit_recovery_password_url(@recovery_password)
    assert_response :success
  end

  test "should update recovery_password" do
    patch recovery_password_url(@recovery_password), params: { recovery_password: { created_at: @recovery_password.created_at, delete_at: @recovery_password.delete_at, progress: @recovery_password.progress, recovery_password_id: @recovery_password.recovery_password_id, state: @recovery_password.state, token: @recovery_password.token, update_at: @recovery_password.update_at, user_id: @recovery_password.user_id } }
    assert_redirected_to recovery_password_url(@recovery_password)
  end

  test "should destroy recovery_password" do
    assert_difference('RecoveryPassword.count', -1) do
      delete recovery_password_url(@recovery_password)
    end

    assert_redirected_to recovery_passwords_url
  end
end
