require 'test_helper'

class PlanDaysControllerTest < ActionController::TestCase
  setup do
    @plan_day = plan_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plan_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plan_day" do
    assert_difference('PlanDay.count') do
      post :create, plan_day: { plan_id: @plan_day.plan_id }
    end

    assert_redirected_to plan_day_path(assigns(:plan_day))
  end

  test "should show plan_day" do
    get :show, id: @plan_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plan_day
    assert_response :success
  end

  test "should update plan_day" do
    put :update, id: @plan_day, plan_day: { plan_id: @plan_day.plan_id }
    assert_redirected_to plan_day_path(assigns(:plan_day))
  end

  test "should destroy plan_day" do
    assert_difference('PlanDay.count', -1) do
      delete :destroy, id: @plan_day
    end

    assert_redirected_to plan_days_path
  end
end
