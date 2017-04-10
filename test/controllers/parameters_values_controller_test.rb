require 'test_helper'

class ParametersValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parameters_value = parameters_values(:one)
  end

  test "should get index" do
    get parameters_values_url
    assert_response :success
  end

  test "should get new" do
    get new_parameters_value_url
    assert_response :success
  end

  test "should create parameters_value" do
    assert_difference('ParametersValue.count') do
      post parameters_values_url, params: { parameters_value: { created_at: @parameters_value.created_at, delete_at: @parameters_value.delete_at, parameter_id: @parameters_value.parameter_id, parameter_value_id: @parameters_value.parameter_value_id, state: @parameters_value.state, update_at: @parameters_value.update_at, value: @parameters_value.value } }
    end

    assert_redirected_to parameters_value_url(ParametersValue.last)
  end

  test "should show parameters_value" do
    get parameters_value_url(@parameters_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_parameters_value_url(@parameters_value)
    assert_response :success
  end

  test "should update parameters_value" do
    patch parameters_value_url(@parameters_value), params: { parameters_value: { created_at: @parameters_value.created_at, delete_at: @parameters_value.delete_at, parameter_id: @parameters_value.parameter_id, parameter_value_id: @parameters_value.parameter_value_id, state: @parameters_value.state, update_at: @parameters_value.update_at, value: @parameters_value.value } }
    assert_redirected_to parameters_value_url(@parameters_value)
  end

  test "should destroy parameters_value" do
    assert_difference('ParametersValue.count', -1) do
      delete parameters_value_url(@parameters_value)
    end

    assert_redirected_to parameters_values_url
  end
end
