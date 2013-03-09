require 'test_helper'

class SpotCandidatesControllerTest < ActionController::TestCase
  setup do
    @spot_candidate = spot_candidates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spot_candidates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spot_candidate" do
    assert_difference('SpotCandidate.count') do
      post :create, spot_candidate: { request_id: @spot_candidate.request_id, spot_id: @spot_candidate.spot_id, user_id: @spot_candidate.user_id }
    end

    assert_redirected_to spot_candidate_path(assigns(:spot_candidate))
  end

  test "should show spot_candidate" do
    get :show, id: @spot_candidate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spot_candidate
    assert_response :success
  end

  test "should update spot_candidate" do
    put :update, id: @spot_candidate, spot_candidate: { request_id: @spot_candidate.request_id, spot_id: @spot_candidate.spot_id, user_id: @spot_candidate.user_id }
    assert_redirected_to spot_candidate_path(assigns(:spot_candidate))
  end

  test "should destroy spot_candidate" do
    assert_difference('SpotCandidate.count', -1) do
      delete :destroy, id: @spot_candidate
    end

    assert_redirected_to spot_candidates_path
  end
end
