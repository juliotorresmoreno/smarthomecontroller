require 'test_helper'

class PetitionsTrackingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @petitions_tracking = petitions_trackings(:one)
  end

  test "should get index" do
    get petitions_trackings_url
    assert_response :success
  end

  test "should get new" do
    get new_petitions_tracking_url
    assert_response :success
  end

  test "should create petitions_tracking" do
    assert_difference('PetitionsTracking.count') do
      post petitions_trackings_url, params: { petitions_tracking: { comemnt: @petitions_tracking.comemnt, created_at: @petitions_tracking.created_at, delete_at: @petitions_tracking.delete_at, petition_id: @petitions_tracking.petition_id, petition_tracking_id: @petitions_tracking.petition_tracking_id, state: @petitions_tracking.state, update_at: @petitions_tracking.update_at, user_id: @petitions_tracking.user_id } }
    end

    assert_redirected_to petitions_tracking_url(PetitionsTracking.last)
  end

  test "should show petitions_tracking" do
    get petitions_tracking_url(@petitions_tracking)
    assert_response :success
  end

  test "should get edit" do
    get edit_petitions_tracking_url(@petitions_tracking)
    assert_response :success
  end

  test "should update petitions_tracking" do
    patch petitions_tracking_url(@petitions_tracking), params: { petitions_tracking: { comemnt: @petitions_tracking.comemnt, created_at: @petitions_tracking.created_at, delete_at: @petitions_tracking.delete_at, petition_id: @petitions_tracking.petition_id, petition_tracking_id: @petitions_tracking.petition_tracking_id, state: @petitions_tracking.state, update_at: @petitions_tracking.update_at, user_id: @petitions_tracking.user_id } }
    assert_redirected_to petitions_tracking_url(@petitions_tracking)
  end

  test "should destroy petitions_tracking" do
    assert_difference('PetitionsTracking.count', -1) do
      delete petitions_tracking_url(@petitions_tracking)
    end

    assert_redirected_to petitions_trackings_url
  end
end
