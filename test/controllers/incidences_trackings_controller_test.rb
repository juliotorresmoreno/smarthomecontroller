require 'test_helper'

class IncidencesTrackingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incidences_tracking = incidences_trackings(:one)
  end

  test "should get index" do
    get incidences_trackings_url
    assert_response :success
  end

  test "should get new" do
    get new_incidences_tracking_url
    assert_response :success
  end

  test "should create incidences_tracking" do
    assert_difference('IncidencesTracking.count') do
      post incidences_trackings_url, params: { incidences_tracking: { comment: @incidences_tracking.comment, created_at: @incidences_tracking.created_at, delete_at: @incidences_tracking.delete_at, incidence_id: @incidences_tracking.incidence_id, incidence_tracking_id: @incidences_tracking.incidence_tracking_id, state: @incidences_tracking.state, update_at: @incidences_tracking.update_at, user_id: @incidences_tracking.user_id } }
    end

    assert_redirected_to incidences_tracking_url(IncidencesTracking.last)
  end

  test "should show incidences_tracking" do
    get incidences_tracking_url(@incidences_tracking)
    assert_response :success
  end

  test "should get edit" do
    get edit_incidences_tracking_url(@incidences_tracking)
    assert_response :success
  end

  test "should update incidences_tracking" do
    patch incidences_tracking_url(@incidences_tracking), params: { incidences_tracking: { comment: @incidences_tracking.comment, created_at: @incidences_tracking.created_at, delete_at: @incidences_tracking.delete_at, incidence_id: @incidences_tracking.incidence_id, incidence_tracking_id: @incidences_tracking.incidence_tracking_id, state: @incidences_tracking.state, update_at: @incidences_tracking.update_at, user_id: @incidences_tracking.user_id } }
    assert_redirected_to incidences_tracking_url(@incidences_tracking)
  end

  test "should destroy incidences_tracking" do
    assert_difference('IncidencesTracking.count', -1) do
      delete incidences_tracking_url(@incidences_tracking)
    end

    assert_redirected_to incidences_trackings_url
  end
end
