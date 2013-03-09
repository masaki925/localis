require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post :create, request: { budget_hotel: @request.budget_hotel, budget_meal: @request.budget_meal, end_datetime: @request.end_datetime, option_booking: @request.option_booking, option_edit: @request.option_edit, option_guide: @request.option_guide, option_pdf: @request.option_pdf, option_qa: @request.option_qa, option_transport: @request.option_transport, people_num: @request.people_num, start_datetime: @request.start_datetime, title: @request.title, user_id: @request.user_id }
    end

    assert_redirected_to request_path(assigns(:request))
  end

  test "should show request" do
    get :show, id: @request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request
    assert_response :success
  end

  test "should update request" do
    put :update, id: @request, request: { budget_hotel: @request.budget_hotel, budget_meal: @request.budget_meal, end_datetime: @request.end_datetime, option_booking: @request.option_booking, option_edit: @request.option_edit, option_guide: @request.option_guide, option_pdf: @request.option_pdf, option_qa: @request.option_qa, option_transport: @request.option_transport, people_num: @request.people_num, start_datetime: @request.start_datetime, title: @request.title, user_id: @request.user_id }
    assert_redirected_to request_path(assigns(:request))
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, id: @request
    end

    assert_redirected_to requests_path
  end
end
