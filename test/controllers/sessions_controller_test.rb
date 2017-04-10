require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session = sessions(:one)
  end

  test "should get index" do
    get sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should create session" do
    assert_difference('Session.count') do
      post sessions_url, params: { session: { created_at: @session.created_at, delete_at: @session.delete_at, expires: @session.expires, session_id: @session.session_id, state: @session.state, token: @session.token, update_at: @session.update_at, user_id: @session.user_id } }
    end

    assert_redirected_to session_url(Session.last)
  end

  test "should show session" do
    get session_url(@session)
    assert_response :success
  end

  test "should get edit" do
    get edit_session_url(@session)
    assert_response :success
  end

  test "should update session" do
    patch session_url(@session), params: { session: { created_at: @session.created_at, delete_at: @session.delete_at, expires: @session.expires, session_id: @session.session_id, state: @session.state, token: @session.token, update_at: @session.update_at, user_id: @session.user_id } }
    assert_redirected_to session_url(@session)
  end

  test "should destroy session" do
    assert_difference('Session.count', -1) do
      delete session_url(@session)
    end

    assert_redirected_to sessions_url
  end
end
