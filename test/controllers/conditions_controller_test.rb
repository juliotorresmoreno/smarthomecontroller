require 'test_helper'

class ConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @condition = conditions(:one)
  end

  test "should get index" do
    get conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_condition_url
    assert_response :success
  end

  test "should create condition" do
    assert_difference('Condition.count') do
      post conditions_url, params: { condition: { condition: @condition.condition, condition_id: @condition.condition_id, condition_type: @condition.condition_type, created_at: @condition.created_at, delete_at: @condition.delete_at, schedule_id: @condition.schedule_id, state: @condition.state, update_at: @condition.update_at } }
    end

    assert_redirected_to condition_url(Condition.last)
  end

  test "should show condition" do
    get condition_url(@condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_condition_url(@condition)
    assert_response :success
  end

  test "should update condition" do
    patch condition_url(@condition), params: { condition: { condition: @condition.condition, condition_id: @condition.condition_id, condition_type: @condition.condition_type, created_at: @condition.created_at, delete_at: @condition.delete_at, schedule_id: @condition.schedule_id, state: @condition.state, update_at: @condition.update_at } }
    assert_redirected_to condition_url(@condition)
  end

  test "should destroy condition" do
    assert_difference('Condition.count', -1) do
      delete condition_url(@condition)
    end

    assert_redirected_to conditions_url
  end
end
