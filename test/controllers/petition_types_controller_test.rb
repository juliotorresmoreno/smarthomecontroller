require 'test_helper'

class PetitionTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @petition_type = petition_types(:one)
  end

  test "should get index" do
    get petition_types_url
    assert_response :success
  end

  test "should get new" do
    get new_petition_type_url
    assert_response :success
  end

  test "should create petition_type" do
    assert_difference('PetitionType.count') do
      post petition_types_url, params: { petition_type: { created_at: @petition_type.created_at, delete_at: @petition_type.delete_at, name: @petition_type.name, petition_type_id: @petition_type.petition_type_id, state: @petition_type.state, update_at: @petition_type.update_at } }
    end

    assert_redirected_to petition_type_url(PetitionType.last)
  end

  test "should show petition_type" do
    get petition_type_url(@petition_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_petition_type_url(@petition_type)
    assert_response :success
  end

  test "should update petition_type" do
    patch petition_type_url(@petition_type), params: { petition_type: { created_at: @petition_type.created_at, delete_at: @petition_type.delete_at, name: @petition_type.name, petition_type_id: @petition_type.petition_type_id, state: @petition_type.state, update_at: @petition_type.update_at } }
    assert_redirected_to petition_type_url(@petition_type)
  end

  test "should destroy petition_type" do
    assert_difference('PetitionType.count', -1) do
      delete petition_type_url(@petition_type)
    end

    assert_redirected_to petition_types_url
  end
end
