require 'test_helper'

class IncidencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incidence = incidences(:one)
  end

  test "should get index" do
    get incidences_url
    assert_response :success
  end

  test "should get new" do
    get new_incidence_url
    assert_response :success
  end

  test "should create incidence" do
    assert_difference('Incidence.count') do
      post incidences_url, params: { incidence: { created_at: @incidence.created_at, delete_at: @incidence.delete_at, description: @incidence.description, incidence_id: @incidence.incidence_id, incidence_type_id: @incidence.incidence_type_id, progress: @incidence.progress, state: @incidence.state, title: @incidence.title, update_at: @incidence.update_at } }
    end

    assert_redirected_to incidence_url(Incidence.last)
  end

  test "should show incidence" do
    get incidence_url(@incidence)
    assert_response :success
  end

  test "should get edit" do
    get edit_incidence_url(@incidence)
    assert_response :success
  end

  test "should update incidence" do
    patch incidence_url(@incidence), params: { incidence: { created_at: @incidence.created_at, delete_at: @incidence.delete_at, description: @incidence.description, incidence_id: @incidence.incidence_id, incidence_type_id: @incidence.incidence_type_id, progress: @incidence.progress, state: @incidence.state, title: @incidence.title, update_at: @incidence.update_at } }
    assert_redirected_to incidence_url(@incidence)
  end

  test "should destroy incidence" do
    assert_difference('Incidence.count', -1) do
      delete incidence_url(@incidence)
    end

    assert_redirected_to incidences_url
  end
end
