require 'test_helper'

class UsersDescsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_desc = users_descs(:one)
  end

  test "should get index" do
    get users_descs_url
    assert_response :success
  end

  test "should get new" do
    get new_users_desc_url
    assert_response :success
  end

  test "should create users_desc" do
    assert_difference('UsersDesc.count') do
      post users_descs_url, params: { users_desc: { address: @users_desc.address, birth_date: @users_desc.birth_date, cell_phone: @users_desc.cell_phone, city_residence_id: @users_desc.city_residence_id, created_at: @users_desc.created_at, delete_at: @users_desc.delete_at, phone: @users_desc.phone, sex_id: @users_desc.sex_id, state: @users_desc.state, update_at: @users_desc.update_at, user_desc_id: @users_desc.user_desc_id, user_id: @users_desc.user_id } }
    end

    assert_redirected_to users_desc_url(UsersDesc.last)
  end

  test "should show users_desc" do
    get users_desc_url(@users_desc)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_desc_url(@users_desc)
    assert_response :success
  end

  test "should update users_desc" do
    patch users_desc_url(@users_desc), params: { users_desc: { address: @users_desc.address, birth_date: @users_desc.birth_date, cell_phone: @users_desc.cell_phone, city_residence_id: @users_desc.city_residence_id, created_at: @users_desc.created_at, delete_at: @users_desc.delete_at, phone: @users_desc.phone, sex_id: @users_desc.sex_id, state: @users_desc.state, update_at: @users_desc.update_at, user_desc_id: @users_desc.user_desc_id, user_id: @users_desc.user_id } }
    assert_redirected_to users_desc_url(@users_desc)
  end

  test "should destroy users_desc" do
    assert_difference('UsersDesc.count', -1) do
      delete users_desc_url(@users_desc)
    end

    assert_redirected_to users_descs_url
  end
end
